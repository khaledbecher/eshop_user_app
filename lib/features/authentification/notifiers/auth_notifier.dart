import 'package:eshop/common/utils/interaction_utils/dialogs/info_dialog.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';
import 'package:eshop/common/utils/services/remote/post_sign_in_service.dart';
import 'package:eshop/features/authentification/data/services/remote/auth_service.dart';
import 'package:eshop/features/authentification/ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool _forgotPasswordLoading = false;
  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get isLoading => _isLoading;
  bool get forgotPasswordLoading => _forgotPasswordLoading;

  /// Sign in with email and password
  Future<bool> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      User? user =
          await AuthService.signInWithEmailAndPassword(email, password);
      if (user != null && user.emailVerified) {
        await SecureStorageService.saveUid(user.uid);

        await PostLoginService.loadUserData(context);

        return true;
      } else if (user != null) {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return InfoDialog(
                message:
                    'A verification email has been sent to\n${user.email}\nPlease verify your email before logging in.',
                buttonText: 'Ok',
              );
            },
          );
        }
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// register with email and password
  Future<void> registerWithEmailAndPassword(
      {required BuildContext context,
      required String userName,
      required String phoneNumber,
      required String dateOfBirth,
      required String email,
      required String password}) async {
    _isLoading = true;
    notifyListeners();

    try {
      User? user = await AuthService.registerWithEmailAndPassword(
          userName: userName,
          email: email,
          password: password,
          dateOfBirth: dateOfBirth,
          phoneNumber: phoneNumber);

      // Check if user is not null and save UID to secure storage if successful
      if (user != null) {
        await SecureStorageService.saveUid(user.uid);

        // Load user-specific data
        await PostLoginService.loadUserData(context);

        if (context.mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return InfoDialog(
                message:
                    'A verification email has been sent to\n${user.email}\nPlease verify your email before logging in.',
                buttonText: 'Login',
                onButtonPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              );
            },
          );
        }
      }
    } catch (e) {
      throw(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Change password
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      await AuthService.reauthenticateAndChangePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      return true;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> forgotPassword({required String email}) async {
    _forgotPasswordLoading = true;
    notifyListeners();
    try {
      final success = await AuthService.sendPasswordResetEmail(email);
      return success;
    } catch (e) {
      throw(msg: e.toString());
    } finally {
      _forgotPasswordLoading = false;
      notifyListeners();
    }
  }

  Future<bool> logOut() async {
    _isLoading = true;
    notifyListeners();
    try {
      await AuthService.signOut();
      await SecureStorageService.deleteUid();
      return true;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool isAuthentified(BuildContext ctx) {
    final isAuthentified = AuthService.auth.currentUser != null;
    if (isAuthentified) {
      PostLoginService.loadUserData(ctx);
    }
    return isAuthentified;
  }
}
