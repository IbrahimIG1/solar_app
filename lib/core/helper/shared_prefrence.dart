import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar/core/constance/constance.dart';

class SharedPref {
  SharedPref._private();
  static SharedPref? _instance;
  factory SharedPref() {
    if (_instance == null) {
      _instance = SharedPref._private();

      return _instance!;
    } else {
      return _instance!;
    }
  }

  static SharedPreferences? _sharedprefrence;

  static Future<SharedPreferences> initSharedPreference() async {
    if (_sharedprefrence == null) {
      return _sharedprefrence = await SharedPreferences.getInstance();
    } else {
      return _sharedprefrence!;
    }
  }

  // Function to save List<Map> in SharedPreferences
  Future<void> saveListOfMaps(List<Map<String, dynamic>> listOfMaps) async {
    print("before add ${listOfMaps}");
    listOfMaps.addAll(await getListOfMaps());
    print("afetr add ${listOfMaps}");
    // Convert the List<Map> to a JSON string
    String jsonString = jsonEncode(listOfMaps);

    // Save the JSON string to SharedPreferences
    await _sharedprefrence!.setString(pdfContent, jsonString);
    // print("Save List of map in shared prefs >> $pdfList");
  }

  // Function to retrieve List<Map> from SharedPreferences
  Future<List<Map<String, dynamic>>> getListOfMaps() async {
    // Get the JSON string from SharedPreferences
    String? jsonString = _sharedprefrence!.getString(pdfContent);

    if (jsonString != null) {
      // Convert the JSON string back to List<Map>
      List<dynamic> jsonResponse = jsonDecode(jsonString);

      // Return as List<Map<String, dynamic>>
      return jsonResponse.cast<Map<String, dynamic>>();
    }

    // Return an empty list if no data found
    return [];
  }

  /// Delete All Data From SharedPreference
  void clearData() {
    _sharedprefrence!.clear();
  }

  /// Delete Specific value From SharedPreference with [key]
  void removeData(String key) {
    _sharedprefrence!.remove(key);
  }

  /// Save String value in SharedPreference with [key] , [value]
  void setString(String key, dynamic value) {
    print('>>>>>>>>>>>>>>>>>>>set String done');
    _sharedprefrence!.setString(key, value);
  }

  /// Get String value From SharedPreference with [key]
  String? getString(String key) {
    return _sharedprefrence!.getString(key) ?? '';
  }

  /// Save Bool value in SharedPreference with [key] , [value]
  void setBool(String key, dynamic value) {
    print('>>>>>>>>>>>>>>>>>>>set String done');
    _sharedprefrence!.setBool(key, value);
  }

  /// Get Bool value From SharedPreference with [key]
  bool? getBool(String key) {
    return _sharedprefrence!.getBool(key);
  }

  /// Save String value in SharedPreference with [key] , [value]

  // @override
  // void setSecureString(String key, value) async {
  //   const FlutterSecureStorage flutterSecure = FlutterSecureStorage();
  //   await flutterSecure.write(key: key, value: value);
  // }

  // /// Get String value From FlutterSecureStorage with [key]
  // @override
  // Future<String?> getSecureString(String key) {
  //   const FlutterSecureStorage flutterSecure = FlutterSecureStorage();
  //   return flutterSecure.read(key: key);
  // }
}
