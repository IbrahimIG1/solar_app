import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solar/core/firebase/cloud_firestore.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';

class FirebaseRepo {
  final PanalServices panalServices;

  // Constructor that takes FirebaseCloudServices
  FirebaseRepo(this.panalServices);


  // Method to add panals data
  Future<DataResult<void>> addPanals(
      {required Map<String, dynamic> panalsData,
      required String collection,
    // required Map<String, dynamic> typesNames,

      required String docUid,
      required String collectionName}) async {
    try {
      final response = await panalServices.addData(
        // typesNames: typesNames,
          docUid: docUid,
          collection: collection,
          collectionNameUid: "$collectionName+Uid",
          collectionName: collectionName,
          data: panalsData);

      return DataResult.success(response);
    } catch (error) {
      print("Error adding addPanals: $error");
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  // Method to get a specific driver by ID
  Future<Map<String, dynamic>?> getPanals(
    String panalsId,
    String collection,
  ) async {
    try {
      Map<String, dynamic>? panalsData =
          await panalServices.getDataById(collection, panalsId);
      if (panalsData != null) {
        print("panals retrieved successfully");
        return panalsData;
      } else {
        print("panals not found");
        return null;
      }
    } catch (e) {
      print("Error getting panals: $e");
      return null;
    }
  }

  // Method to get all panalss' data
  Future<DataResult<QuerySnapshot<Map<String, dynamic>>>> getAllpanals(
      {required String collectionName,
      required String docUid,
      required String collection}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> panals =
          await panalServices.getAllData(
              collectionName: collectionName,
              docUid: docUid,
              collection: collection);
      print("Get Data in Repo >> ${panals.docs.first.data()}");
      return DataResult.success(panals);
    } catch (error) {
      print("Error getting all panals: $error");
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  // Stream<DataResult<QuerySnapshot<Map<String, dynamic>>>> streamGetAllpanalss() {
  //   try {
  //     Stream<QuerySnapshot<Map<String, dynamic>>> panalssStream =
  //         panalServices.getDataStream(collection);
  //     return panalssStream.map((querySnapshot) {
  //       return DataResult.success(querySnapshot);
  //     });
  //   } catch (error) {
  //     print("Error getting all panalss: $error");
  //     return Stream.value(
  //         DataResult.failure(ErrorHandler.handleException(error)));
  //   }
  // }

  // Method to get all panalss along with their document IDs
  Future<List<Map<String, dynamic>>> getAllpanalssWithIds(
      {required String collection}) async {
    try {
      List<Map<String, dynamic>> panalssWithIds = [];

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(collection).get();
      for (var doc in querySnapshot.docs) {
        panalssWithIds.add({
          'id': doc.id,
          'data': doc.data(),
        });
      }

      print("All panalss with IDs retrieved successfully");
      return panalssWithIds;
    } catch (e) {
      print("Error getting all panalss with IDs: $e");
      return [];
    }
  }

  // Method to update panals data
  Future<void> updatepanals(
      {required String panalsId,
      required Map<String, dynamic> updatedData,
      required String collection}) async {
    try {
      await panalServices.updateData(collection, panalsId, updatedData);
      print("panals updated successfully");
    } catch (e) {
      print("Error updating panals: $e");
    }
  }

  // Method to delete a panals by ID
  Future<void> deletepanals(
      {required String panalsId, required String collection}) async {
    try {
      await panalServices.deleteDataById(collection, panalsId);
      print("panals deleted successfully");
    } catch (e) {
      print("Error deleting panals: $e");
    }
  }
}
