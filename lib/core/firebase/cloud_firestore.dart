import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solar/core/firebase/firebase_factory.dart';

abstract class PanalServices {
  Future<void> addData(
      {required String collection,
      required String docUid,
      required String collectionName,
      // required Map<String, dynamic> typesNames,
      required String collectionNameUid,
      required Map<String, dynamic> data});
  Future<QuerySnapshot<Map<String, dynamic>>> getAllData({
    required String collectionName,
    required String docUid,
    required String collection,
  });
  // Stream<QuerySnapshot<Map<String, dynamic>>> getDataStream(String collection);
  Future<Map<String, dynamic>?> getDataById(String collection, String docId);
  Future<void> updateData(
      String collection, String docId, Map<String, dynamic> newData);
  Future<void> deleteDataById(String collection, String docId);
}

class CloudFirestoreServicesImp implements PanalServices {
  final FirebaseFactory firebaseFactory;

  CloudFirestoreServicesImp(this.firebaseFactory);

  /// Method to add data to a Firestore collection
  @override
  Future<void> addData({
    required String collection,
    required String collectionName,
    required String collectionNameUid,
    required String docUid,
    required Map<String, dynamic> data,
    // required Map<String, dynamic> typesNames,
  }) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    // await firestore.collection(collection).doc(docUid).set(typesNames);
    // print("Data Name is >>>>>>> $typesNames");

    await firestore
        .collection(collection)
        .doc(docUid)
        .collection(collectionName)
        .doc(collectionNameUid)
        .set(data);
    // return await firestore.collection(collection).doc(docUid).set(data);
  }

  //* Method to get all documents from a Firestore collection
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllData(
      {required String collectionName,
      required String docUid,
      required String collection}) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection(collection)
        .doc(docUid)
        .collection(collectionName)
        .get();
    print("Get Data in factory >> ${querySnapshot.docs.first.data()}");
    return querySnapshot;
  }

  // @override
  // Stream<QuerySnapshot<Map<String, dynamic>>> getDataStream(String collection) {
  //   FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
  //   Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot =
  //       firestore.collection(collection).snapshots();
  //   return querySnapshot;
  // }

  //* Method to get a specific document by ID from a Firestore collection
  @override
  Future<Map<String, dynamic>?> getDataById(
      String collection, String docId) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      DocumentSnapshot docSnapshot =
          await firestore.collection(collection).doc(docId).get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>?;
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error getting document: $e");
      return null;
    }
  }

  //* Method to update a document in a Firestore collection
  @override
  Future<void> updateData(
      String collection, String docId, Map<String, dynamic> newData) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      await firestore.collection(collection).doc(docId).update(newData);
      print("Data updated successfully");
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  //* Method to delete a document from a Firestore collection
  @override
  Future<void> deleteDataById(String collection, String docId) async {
    FirebaseFirestore firestore = firebaseFactory.getFirebaseFirestore();
    try {
      await firestore.collection(collection).doc(docId).delete();
      print("Document deleted successfully");
    } catch (e) {
      print("Error deleting document: $e");
    }
  }
}
