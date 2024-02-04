import 'dart:io';

import 'package:image_picker/image_picker.dart';

class GalleryController {
  File? _image;

  List<File?> selectedImage = [];
  ImagePicker _picker = ImagePicker();
  GalleryController();

  List<File?> removeImage({required File image}) {
    selectedImage.remove(image);
    return selectedImage;
  }

  Future<List<File?>> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      if (_image != null) {
        selectedImage.add(_image);
        _image = null;
      }
    }

    return selectedImage;
  }
}
