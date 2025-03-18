import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/common/constants/endpoints.dart';
import 'package:eshop/common/utils/services/clients/firestore_client.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';
import 'package:eshop/common/utils/services/remote/products_service.dart';
import 'package:eshop/models/purchase.dart';

class CartService {
  static Future<void> addPurchase(Purchase purchase) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.addToListField(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        fieldName: 'cartItems',
        valueToAdd: {
          'product': purchase.product!.id,
          'quantity': purchase.quantity
        });
  }

  static Future<void> removePurchase(Purchase purchase) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.removeFromListField(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        fieldName: 'cartItems',
        valueToRemove: {
          'product': purchase.product!.id,
          'quantity': purchase.quantity
        });
  }

  static Future<void> clearPurchases() async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.updateDocument(
      collectionPath: EndPoints.usersCollection,
      documentId: uid,
      data: {'cartItems': []},
    );
  }

  static Future<void> updatePurchaseQuantity({
    required Purchase purchase,
    required int offset,
  }) async {
    try {
      final documentId = await EndPoints.userDocumentId();
      // Fetch the document
      DocumentSnapshot purchasesDoc = await FirestoreClient.getDocument(
          collectionPath: EndPoints.usersCollection, documentId: documentId);

      if (!purchasesDoc.exists) {
        throw Exception('Document does not exist');
      }

      // Get the list of purchases
      List<dynamic> purchases = purchasesDoc.get('cartItems') ?? [];

      // Modify the quantity
      for (var element in purchases) {
        if (element['product'] == purchase.product!.id) {
          element['quantity'] = element['quantity'] + offset;
          break; // Stop once we update the order
        }
      }
      // Update Firestore with the modified purchases list
      await FirestoreClient.updateDocument(
        collectionPath: EndPoints.usersCollection,
        documentId: documentId,
        data: {'cartItems': purchases},
      );
    } catch (e) {
      throw Exception('Error updating order status: $e');
    }
  }

  static Future<List<dynamic>> fetchPurchases() async {
    final documentId = await EndPoints.userDocumentId();
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: EndPoints.usersCollection, documentId: documentId);
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List purchases = data['cartItems'] as List<dynamic>;
      purchases = await Future.wait(purchases.map((element) async {
        final product = await ProductsService.fetchProductById(
            element['product'].toString());
        return {'product': product, 'quantity': element['quantity']};
      }).toList());
      return purchases;
    } else {
      throw Exception('Document does not exist at the specified path');
    }
  }
}
