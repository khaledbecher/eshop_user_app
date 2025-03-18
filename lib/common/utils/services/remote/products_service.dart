import 'package:eshop/common/constants/endpoints.dart';
import 'package:eshop/common/utils/services/clients/firestore_client.dart';

class ProductsService {
  static Future<List<dynamic>> fetchAllProducts() async {
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: EndPoints.allProducts, documentId: 'products');

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final products = data['products'] as List<dynamic>;
      return products;
    } else {
      throw Exception('Document does not exist at the specified path');
    }
  }

  static Future<List<dynamic>> fetchProductsByCategory(String? category) async {
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: (category == 'Fashion')
            ? EndPoints.fashionCollection
            : (category == 'Sports')
                ? EndPoints.sportsCollection
                : (category == 'Technology')
                    ? EndPoints.technologyCollection
                    : EndPoints.allProducts,
        documentId: 'products');

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final products = data['products'] as List<dynamic>;
      return products;
    } else {
      throw Exception('Document does not exist at the specified path');
    }
  }

  static Future<List<dynamic>> fetchProductsRatingSort() async {
    List<dynamic> products = await fetchAllProducts();
    // Ensure the items are maps and sort by rating
    final sortedProducts = products
        .where((product) =>
            product is Map<String, dynamic> && product.containsKey('rating'))
        .cast<Map<String, dynamic>>()
        .toList()
      ..sort((a, b) => (b['rating'] as num).compareTo(a['rating'] as num));

    // Get the top 5 rated products
    return sortedProducts.take(5).toList();
  }

  static Future<List<dynamic>> fetchProductsDiscountSort() async {
    List<dynamic> products = await fetchAllProducts();
    // Ensure the items are maps and sort by rating
    final sortedProducts = products
        .where((product) =>
            product is Map<String, dynamic> && product.containsKey('rating'))
        .cast<Map<String, dynamic>>()
        .toList()
      ..sort((a, b) => (b['discountPercentage'] as num)
          .compareTo(a['discountPercentage'] as num));

    // Get the top 5 rated products
    return sortedProducts.take(5).toList();
  }

  static Future<List<dynamic>> fetchProductsWithFilter({
    required double maxPrice,
    String? category,
    String? gender,
    String? subCategory,
  }) async {
    List<dynamic> products = await fetchProductsByCategory(category);
    List filteredProducts = products.where((product) {
      return product['price'] <= maxPrice;
    }).toList();

    if (gender != null && subCategory != null) {
      filteredProducts = filteredProducts.where((product) {
        return ((product['category'] as String)
                .startsWith(gender == 'Men' ? 'mens-' : 'womens-') &&
            (product['category'] as String).contains(subCategory));
      }).toList();
      return filteredProducts;
    } else if (gender != null && subCategory == null) {
      filteredProducts = filteredProducts.where((product) {
        return (product['category'] as String)
            .startsWith(gender == 'Men' ? 'mens-' : 'womens-');
      }).toList();
      return filteredProducts;
    }

    if (category == 'Sports' && subCategory != null) {
      filteredProducts = filteredProducts.where((product) {
        return ((product['tags'] as List).last) == subCategory;
      }).toList();
      return filteredProducts;
    } else if (category != null && subCategory != null) {
      filteredProducts = filteredProducts.where((product) {
        return product['category'] == subCategory;
      }).toList();
      return filteredProducts;
    }
    return filteredProducts;
  }

  static Future<List<dynamic>> searchProductsWithFilter({
    required String keyword,
    required double maxPrice,
    String? category,
    String? gender,
    String? subCategory,
  }) async {
    List<dynamic> products = await fetchProductsWithFilter(
        category: category,
        maxPrice: maxPrice,
        gender: gender,
        subCategory: subCategory);
    final filteredProducts = products.where((product) {
      final category = product['category'] as String;
      final title = product['title'] as String;
      final tags = product['tags'] as List<dynamic>;

      return category.toLowerCase().contains(keyword.toLowerCase()) ||
          title.toLowerCase().contains(keyword.toLowerCase()) ||
          tags.any((tag) => tag.toLowerCase().contains(keyword.toLowerCase()));
    }).toList();
    return filteredProducts;
  }

  //fetch single product by id
  static Future<Map<String, dynamic>> fetchProductById(String id) async {
    List<dynamic> products = await fetchAllProducts();
    return products
        .where((product) => product['id'].toString() == id)
        .toList()
        .first;
  }
}
