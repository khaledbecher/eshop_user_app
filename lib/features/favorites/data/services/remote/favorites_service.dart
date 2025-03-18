import 'package:eshop/common/constants/endpoints.dart';
import 'package:eshop/common/utils/services/clients/firestore_client.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';
import 'package:eshop/common/utils/services/remote/products_service.dart';

class FavoritesService {
  static Future<void> addFavorite(int id) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.addToListField(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        fieldName: 'favorites',
        valueToAdd: id);
  }

  static Future<void> removeFavorite(int id) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.removeFromListField(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        fieldName: 'favorites',
        valueToRemove: id);
  }

  static Future<List<dynamic>> fetchFavorites() async {
    final documentId = await EndPoints.userDocumentId();
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: EndPoints.usersCollection,
        documentId: documentId);
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final favoritesId = data['favorites'] as List<dynamic>;
      final favorites = await Future.wait(favoritesId.map((id) {
        return ProductsService.fetchProductById(id.toString());
      }).toList());
      return favorites;
    } else {
      throw Exception('Document does not exist at the specified path');
    }
  }
}
