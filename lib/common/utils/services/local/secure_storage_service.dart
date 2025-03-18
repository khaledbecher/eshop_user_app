import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> saveUid(String uid) async {
    await _secureStorage.write(key: 'uid', value: uid);
  }

  static Future<String?> getUid() async {
    return await _secureStorage.read(key: 'uid');
  }

  static Future<void> deleteUid() async {
    await _secureStorage.delete(key: 'uid');
  }
}
