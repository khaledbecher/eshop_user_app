import 'package:eshop/common/utils/services/local/secure_storage_service.dart';

class EndPoints {
  static const String fashionCollection = 'data/products/fashion';
  static const String groceriesCollection = 'data/products/groceries';
  static const String sportsCollection = 'data/products/sports';
  static const String technologyCollection = 'data/products/technology';
  static const String allProducts = 'data/products/allProducts';
  static const String dataCollection = 'data';
  static const String usersCollection = 'users';

  static Future<String> userDocumentId() async {
    String uid = await SecureStorageService.getUid() ?? '';
    return uid;
  }
}
