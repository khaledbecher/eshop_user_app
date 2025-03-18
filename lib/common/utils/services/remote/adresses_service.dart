import 'package:eshop/common/constants/endpoints.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/common/utils/services/clients/firestore_client.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';
import 'package:eshop/models/adress.dart';

class AdressesService {
  static Future<List<dynamic>> fetchAdresses() async {
    final documentId = await EndPoints.userDocumentId();
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: EndPoints.usersCollection,
        documentId: documentId);
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final adresses = data['adresses'] as List<dynamic>;
      return adresses;
    } else {
      throw Exception('Document does not exist at the specified path');
    }
  }

  static Future<void> addAdress(Adress adress) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.addToListField(
      collectionPath: EndPoints.usersCollection,
      documentId: uid,
      fieldName: 'adresses',
      valueToAdd: adress.toJson(),
    );
  }

  static Future<void> removeAdress(Adress adress) async {
    String uid = await SecureStorageService.getUid() ?? '';
    await FirestoreClient.removeFromListField(
        collectionPath: EndPoints.usersCollection,
        documentId: uid,
        fieldName: 'adresses',
        valueToRemove: adress.toJson());
  }

  static Future<void> editAdress(Adress oldAdress, Adress newAdress) async {
    String uid = await SecureStorageService.getUid() ?? '';
    final docSnapshot = await FirestoreClient.getDocument(
        collectionPath: EndPoints.usersCollection, documentId: uid);

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List<dynamic> adresses = List<dynamic>.from(data['adresses'] ?? []);

      int index = adresses.indexWhere((adress) =>
          mapsAreEqual(Map<String, dynamic>.from(adress), oldAdress.toJson()));
      if (index != -1) {
        adresses[index] = newAdress.toJson();

        await FirestoreClient.updateDocument(
          collectionPath: EndPoints.usersCollection,
          documentId: uid,
          data: {'adresses': adresses},
        );
      } else {
        throw Exception('Address not found in the list.');
      }
    } else {
      throw Exception('Document does not exist at the specified path.');
    }
  }
}
