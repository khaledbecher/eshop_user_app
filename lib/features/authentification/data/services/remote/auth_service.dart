import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/common/constants/endpoints.dart';
import 'package:eshop/common/utils/interaction_utils/toasts/toast_utils.dart';
import 'package:eshop/common/utils/services/clients/firestore_client.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:eshop/features/authentification/data/services/remote/email_verification_service.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// Register a new user with email and password
  static Future<User?> registerWithEmailAndPassword(
      {required String userName,
      required String phoneNumber,
      required String dateOfBirth,
      required String email,
      required String password}) async {
    /// Email existance verification
    /* final bool emailExists =
        await EmailVerificationService.verifyEmail(email: email);
    if (!emailExists) {
      showErrorToast(msg: 'Register with an existing email adress');
      throw Exception('failed to register');
    }*/
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        // Send email verification

        await user.sendEmailVerification();
        // Add user document to Firestore
        await firestore
            .collection(EndPoints.usersCollection)
            .doc(user.uid)
            .set({
          'email': user.email,
          'createdAt': FieldValue.serverTimestamp(),
          'favorites': [],
          'userName': userName,
          'phoneNumber': phoneNumber,
          'dateOfBirth': dateOfBirth,
          'adresses': [],
          'orders': [],
          'cartItems': [],
          'fcmTokens': []
        });
        String? token = await messaging.getToken();
        String userId = user.uid;
        if (token != null) {
          FirestoreClient.addToListField(
              collectionPath: EndPoints.usersCollection,
              documentId: userId,
              fieldName: 'fcmTokens',
              valueToAdd: token);
        }
        return user;
      }
      return null;
    } catch (e) {
      showErrorToast(msg: extractError(e.toString()));
      return null;
    }
  }

  /// Sign in an existing user with email and password
  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        final uid = result.user!.uid;
        // Check if the UID exists in the "users" collection
        DocumentSnapshot usersDoc = await FirebaseFirestore.instance
            .collection(EndPoints.usersCollection)
            .doc(uid)
            .get();

        if (!usersDoc.exists) {
          showErrorToast(msg: 'Access denied: Not a user.');
          return null; // User is not an admin
        }
        if (!result.user!.emailVerified) {
          result.user!.sendEmailVerification();
        }
        SecureStorageService.saveUid(result.user!.uid);
        String? token = await messaging.getToken();
        String userId = result.user!.uid;
        if (token != null) {
          FirestoreClient.addToListField(
              collectionPath: EndPoints.usersCollection,
              documentId: userId,
              fieldName: 'fcmTokens',
              valueToAdd: token);
        }
      }

      return result.user; // Return the signed-in user
    } catch (e) {
      showErrorToast(msg: extractError(e.toString()));
      return null;
    }
  }

  /// Change password
  static Future<void> reauthenticateAndChangePassword(
      {required String newPassword, required String currentPassword}) async {
    try {
      User? user = auth.currentUser;

      if (user != null && user.email != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );

        // Reauthenticate the user
        await user.reauthenticateWithCredential(credential);

        // Update the password
        await user.updatePassword(newPassword);
      } else {
        throw Exception('No user is signed in.');
      }
    } catch (e) {
      showErrorToast(msg: extractError(e.toString()));
      throw Exception(e.toString());
    }
  }

  /// Sign out the current user
  static Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      showErrorToast(msg: extractError(e.toString()));
      throw Exception(e.toString());
    }
  }

  /// Send password reset email
  static Future<bool> sendPasswordResetEmail(String email) async {
    bool success = true;
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      showErrorToast(msg: extractError(e.toString()));
      success = false;
      throw Exception(e.toString());
    } finally {
      return success;
    }
  }

  /// Check if user's email is verified
  static Future<bool> isEmailVerified(User user) async {
    await user.reload(); // Reload user data from Firebase
    return user.emailVerified; // Check if email is verified
  }
}

String extractError(String e) {
  RegExp regex = RegExp(r'\] (.*?)[,.]');

  Match? match = regex.firstMatch(e);
  if (match != null) {
    return match.group(1)!; // Extract the part between " " and ,
  } else {
    return e;
  }
}
