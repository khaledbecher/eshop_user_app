import 'package:eshop/common/constants/endpoints.dart';
import 'package:eshop/common/utils/services/clients/firestore_client.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';
import 'package:eshop/common/utils/services/remote/products_service.dart';
import 'package:eshop/models/order.dart';
import 'package:eshop/models/product.dart';
import 'package:eshop/models/purchase.dart';

class OrdersService {
  static Future<void> addOrder(Orderr order) async {
    String uid = await SecureStorageService.getUid() ?? '';
    final ordersDoc = await FirestoreClient.getDocument(
        collectionPath: EndPoints.dataCollection, documentId: 'orders');
    int ordersCount = ordersDoc.get('count');
    order.id = '#order${ordersCount + 1}';
    for (Purchase purchase in order.purchases!) {
      final Product product = purchase.product!;
      late String categoryCollection;
      if (product.category! == 'sports-accessories') {
        categoryCollection = EndPoints.sportsCollection;
      } else if (product.category!.startsWith('mens-') ||
          product.category!.startsWith('womens-')) {
        categoryCollection = EndPoints.fashionCollection;
      } else {
        categoryCollection = EndPoints.technologyCollection;
      }
      final allProductsSnapshot = await FirestoreClient.getDocument(
          collectionPath: EndPoints.allProducts, documentId: 'products');
      final categoryProductsSnapshot = await FirestoreClient.getDocument(
          collectionPath: categoryCollection, documentId: 'products');
      if (!allProductsSnapshot.exists || !categoryProductsSnapshot.exists) {
        throw Exception('Document not found');
      }

      List<dynamic> allProducts = allProductsSnapshot.get('products');
      List<dynamic> categoryProducts = categoryProductsSnapshot.get('products');
      int productIndexInAllProducts =
          allProducts.indexWhere((element) => element['id'] == product.id);
      int productIndexInCategoryProducts =
          categoryProducts.indexWhere((element) => element['id'] == product.id);
      if (productIndexInAllProducts == -1 ||
          productIndexInCategoryProducts == -1) {
        throw Exception('Product not found in array');
      }
      allProducts[productIndexInAllProducts]['stock'] =
          allProducts[productIndexInAllProducts]['stock'] - purchase.quantity;
      categoryProducts[productIndexInCategoryProducts]['stock'] =
          categoryProducts[productIndexInCategoryProducts]['stock'] -
              purchase.quantity;
      await FirestoreClient.updateField(
          collectionPath: EndPoints.allProducts,
          documentId: 'products',
          fieldName: 'products',
          newFieldValue: allProducts);
      await FirestoreClient.updateField(
          collectionPath: categoryCollection,
          documentId: 'products',
          fieldName: 'products',
          newFieldValue: categoryProducts);
    }
    await FirestoreClient.addToListField(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        fieldName: 'orders',
        valueToAdd: order.toFirebase());
    await FirestoreClient.addToListField(
        collectionPath: EndPoints.dataCollection,
        documentId: 'orders',
        fieldName: 'ordersData',
        valueToAdd: order.toFirebase());
    await FirestoreClient.incrementIntegerField(
      collectionPath: EndPoints.dataCollection,
      documentId: 'orders',
      fieldName: 'count',
      offset: 1,
    );
  }

  static Future<void> removeOrder(Orderr order) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.removeFromListField(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        fieldName: 'orders',
        valueToRemove: order.toFirebase());
  }

  static Future<List<dynamic>> fetchOrders() async {
    final documentId = await EndPoints.userDocumentId();
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: EndPoints.usersCollection, documentId: documentId);
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List orders = data['orders'] as List<dynamic>;
      orders = await Future.wait(orders.map((order) async {
        List purchases = order['purchases'];
        purchases = await Future.wait(purchases.map((element) async {
          final product = await ProductsService.fetchProductById(
              element['product'].toString());
          return {'product': product, 'quantity': element['quantity']};
        }).toList());

        order['purchases'] = purchases;
        return order;
      }).toList());
      return orders;
    } else {
      throw Exception('Document does not exist at the specified path');
    }
  }
}
