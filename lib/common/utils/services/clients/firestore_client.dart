import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new document to a collection
  static Future<DocumentReference> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await _firestore.collection(collectionPath).add(data);
    } catch (e) {
      throw Exception('Error adding document: $e');
    }
  }

  // Set a document (creates or overwrites)
  static Future<void> setDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    try {
      await _firestore
          .collection(collectionPath)
          .doc(documentId)
          .set(data, SetOptions(merge: merge));
    } catch (e) {
      throw Exception('Error setting document: $e');
    }
  }

  // Update a document
  static Future<void> updateDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).update(data);
    } catch (e) {
      throw Exception('Error updating document: $e');
    }
  }

  // Get a document
  static Future<DocumentSnapshot> getDocument({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      return await _firestore.collection(collectionPath).doc(documentId).get();
    } catch (e) {
      throw Exception('Error getting document: $e');
    }
  }

  // Get a collection (all documents)
  static Future<List<QueryDocumentSnapshot>> getCollection({
    required String collectionPath,
  }) async {
    try {
      final querySnapshot = await _firestore.collection(collectionPath).get();
      return querySnapshot.docs;
    } catch (e) {
      throw Exception('Error getting collection: $e');
    }
  }

  // Delete a document
  static Future<void> deleteDocument({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).delete();
    } catch (e) {
      throw Exception('Error deleting document: $e');
    }
  }

  // Listen to a document
  static Stream<DocumentSnapshot> listenToDocument({
    required String collectionPath,
    required String documentId,
  }) {
    try {
      return _firestore.collection(collectionPath).doc(documentId).snapshots();
    } catch (e) {
      throw Exception('Error listening to document: $e');
    }
  }

  // Listen to a collection
  static Stream<QuerySnapshot> listenToCollection({
    required String collectionPath,
  }) {
    try {
      return _firestore.collection(collectionPath).snapshots();
    } catch (e) {
      throw Exception('Error listening to collection: $e');
    }
  }

  static Future<void> addToListField({
    required String collectionPath,
    required String documentId,
    required String fieldName,
    required dynamic valueToAdd,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).update({
        fieldName: FieldValue.arrayUnion([valueToAdd]),
      });
    } catch (e) {
      throw Exception("Error adding to list field '$fieldName': $e");
    }
  }

  static Future<void> removeFromListField({
    required String collectionPath,
    required String documentId,
    required String fieldName,
    required dynamic valueToRemove,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).update({
        fieldName: FieldValue.arrayRemove([valueToRemove]),
      });
    } catch (e) {
      throw Exception("Error removing from list field '$fieldName': $e");
    }
  }

  static Future<void> updateField({
    required String collectionPath,
    required String documentId,
    required String fieldName,
    required dynamic newFieldValue,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).update({
        fieldName: newFieldValue,
      });
    } catch (e) {
      throw Exception("Error updating field '$fieldName': $e");
    }
  }

  static Future<void> incrementIntegerField({
    required String collectionPath,
    required String documentId,
    required String fieldName,
    required int offset,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).update({
        fieldName: FieldValue.increment(offset),
      });
    } catch (e) {
      throw Exception("Error incrementing field value '$fieldName': $e");
    }
  }
}
