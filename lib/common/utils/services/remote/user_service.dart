import 'package:eshop/common/constants/endpoints.dart';
import 'package:eshop/common/utils/services/clients/firestore_client.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';

class UserService {
  static Future<Map<String, dynamic>> getUser() async {
    String uid = await SecureStorageService.getUid() ?? '';
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: EndPoints.usersCollection, documentId: uid);

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data;
    } else {
      throw Exception('Document does not exist at the specified path');
    }
  }

  static Future<void> editProfileInfo(
      String fieldName, String fieldValue) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.updateDocument(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        data: {fieldName: fieldValue});
  }
}
