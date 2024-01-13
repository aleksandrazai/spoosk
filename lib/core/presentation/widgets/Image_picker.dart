import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/usecases/galleryController.dart';
import '../image.dart';

class ImagePicker extends StatefulWidget {
  void Function(List<File> listImage) getImage;
  ImagePicker({Key? key, required this.getImage}) : super(key: key);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  GalleryController galleryController = GalleryController();
  List<File> _selectedImage = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _getImage(),
      child: Container(
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color.fromARGB(255, 246, 246, 246)),
        child: Center(child: SvgPicture.asset(image_cross)),
      ),
    );
  }

  _getImage() async {
    final List<File?> result = await galleryController.getImageFromGallery();
    if (result != null) {
      widget
          .getImage(result.where((file) => file != null).cast<File>().toList());
    }
  }
}
