import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/firebase/cloud_firestore.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';

class InverterRepo {
  final FirebaseServices firebaseServices;

  // Constructor that takes FirebaseCloudServices
  InverterRepo(this.firebaseServices);

  // Method to add inverters data
  Future<DataResult<void>> addData({
    required Map<String, dynamic> data,
    required String docUid,
  }) async {
    try {
      final response = await firebaseServices.addData(
          docUid: docUid, collection: inverterCollection, data: data);
      return DataResult.success(response);
    } catch (error) {
      print("Error adding inverters: $error");
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  // Method to get a All Panals Data
  Future<DataResult<Map<String, dynamic>>> getInvertersData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseServices.getData(collection: inverterCollection);
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

  // Method to get all inverters along with their document IDs
  Future<DataResult<Map<String, dynamic>?>> getInvertersWithIds(
      {required String collectionName}) async {
    try {
      Map<String, dynamic>? panals = await firebaseServices.getDataById(
          inverterCollection, collectionName);
      print("All inverters with IDs retrieved successfully");
      return DataResult.success(panals);
    } catch (error) {
      print("Error getting all inverters with IDs: $error");
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  // Method to update Inverters data
  Future<void> updateInverters({
    required String inverterId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      await firebaseServices.updateData(
          inverterCollection, inverterId, updatedData);
      print("inverters updated successfully");
    } catch (e) {
      print("Error updating inverters: $e");
    }
  }

  // Method to delete a Inverters by ID
  Future<void> deleteInverters({required String inverterId}) async {
    try {
      await firebaseServices.deleteDataById(inverterCollection, inverterId);
      print("Inverters deleted successfully");
    } catch (e) {
      print("Error deleting Inverters: $e");
    }
  }
}
