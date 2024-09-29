import 'dart:io';

import 'package:image_picker/image_picker.dart';

class GetImageFromGallery
{
  // File Save Image Which Selected From Gallary
  File? imageFile;
  // ImagePicker Go To Get Images From Gallary
  var picker = ImagePicker();
  String? imagePath;
  // Function To Change Profile Image
  Future<String> getImage() async {
    try {
      picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile!.path);

      print('Get Image');
      print(pickedFile.path);
      imagePath = pickedFile.path;
      return pickedFile.path;
    } catch (e) {
      print('Error in Choose Image >>> ${e.toString()}');
      return "Error in Choose Image";
    }
  }
}