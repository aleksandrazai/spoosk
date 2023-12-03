import 'dart:io';

import 'package:image_picker/image_picker.dart';

class GalleryController {
  File? _image;

  List<File?> selectedImage = [];
  ImagePicker _picker = ImagePicker();
  GalleryController();
  Future<List<File?>> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      if (_image != null) {
        selectedImage.add(_image);
      }
    }

    return selectedImage;
  }

  // Future getImageFromCamera() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  // }
}
