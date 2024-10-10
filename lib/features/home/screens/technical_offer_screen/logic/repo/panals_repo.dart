import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/firebase/cloud_firestore.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';

class PanalsRepo {
  final FirebaseServices firebaseServices;

  // Constructor that takes FirebaseCloudServices
  PanalsRepo(this.firebaseServices);

  // Method to add panals data
  Future<DataResult<void>> addData({
    required Map<String, dynamic> data,
    required String docUid,
  }) async {
    try {
      final response = await firebaseServices.addData(
          docUid: docUid, collection: panalCollection, data: data);
      return DataResult.success(response);
    } catch (error) {
      print("Error adding addPanals: $error");
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  // Method to get a All Panals Data
  Future<DataResult<Map<String, dynamic>>> getPanals() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseServices.getData(collection: panalCollection);
      Map<String, dynamic> data = {};
      for (var element in querySnapshot.docs) {
        print("Elemenet Data is in Repo >>>>>>>>>>>> ${element.data()}");
        data.addEntries(element.data().entries);
      }
      print("panals retrieved successfully");
      return DataResult.success(data);
    } catch (error) {
      print("Error getting panals: $error");
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  // Method to get all Panals along with their document IDs
  Future<DataResult<Map<String, dynamic>?>> getAllpanalssWithIds(
      {required String collectionName}) async {
    try {
      Map<String, dynamic>? panals =
          await firebaseServices.getDataById(panalCollection, collectionName);
      print("All panalss with IDs retrieved successfully");
      return DataResult.success(panals);
    } catch (error) {
      print("Error getting all panalss with IDs: $error");
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  // Method to update panals data
  Future<void> updatepanals({
    required String panalsId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      await firebaseServices.updateData(panalCollection, panalsId, updatedData);
      print("panals updated successfully");
    } catch (e) {
      print("Error updating panals: $e");
    }
  }

  // Method to delete a panals by ID
  Future<void> deletepanals(
      {required String panalsId, required String collection}) async {
    try {
      await firebaseServices.deleteDataById(collection, panalsId);
      print("panals deleted successfully");
    } catch (e) {
      print("Error deleting panals: $e");
    }
  }
}
