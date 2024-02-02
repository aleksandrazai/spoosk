import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/colors.dart';
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
    return Wrap(spacing: 12, children: [
      ..._selectedImage.map((e) {
        return GestureDetector(
          onTap: () => _removeImage(e),
          child: Stack(
            children: [
              Container(
                width: 76,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(
                        fit: BoxFit.cover, width: 56, height: 56, File(e.path)),
                  ),
                ),
              ),
              Positioned(
                  top: 2,
                  left: 56,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        border: Border.all(width: 2, color: AppColors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: const Center(
                        child: Icon(
                      color: Color(0xFFD9D9D9),
                      Icons.close,
                      weight: 2,
                      size: 15,
                    )),
                  ))
            ],
          ),
        );
      }),
      GestureDetector(
        onTap: () => _getImage(),
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color.fromARGB(255, 246, 246, 246)),
          child: Center(child: SvgPicture.asset(image_cross)),
        ),
      )
    ]);
  }

  _removeImage(File imageToRemove) {
    final List<File?> listFile =
        galleryController.removeImage(image: imageToRemove);
    if (listFile != null) {
      print(listFile.length);
      final List<File> result =
          listFile.where((file) => file != null).cast<File>().toList();
      widget.getImage(result);
      setState(() {
        _selectedImage = result;
      });
    }
  }

  _getImage() async {
    final List<File?> listFile = await galleryController.getImageFromGallery();

    if (listFile != null) {
      print(listFile.length);
      final List<File> result =
          listFile.where((file) => file != null).cast<File>().toList();
      widget.getImage(result);
      setState(() {
        _selectedImage = result;
      });
    }
  }
}


// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:spoosk/core/colors.dart';
// import 'package:vector_math/vector_math_64.dart';
// import '../../domain/usecases/galleryController.dart';
// import '../image.dart';

// class ImagePicker extends StatefulWidget {
//   void Function(List<File> listImage) getImage;
//   ImagePicker({Key? key, required this.getImage}) : super(key: key);

//   @override
//   _ImagePickerState createState() => _ImagePickerState();
// }

// class _ImagePickerState extends State<ImagePicker> {
//   GalleryController galleryController = GalleryController();
//   List<File> _selectedImage = [];
//   Offset? _globalPosition;
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(spacing: 12, children: [
//       ..._selectedImage.asMap().entries.map((entry) {
//         int index = entry.key;
//         File e = entry.value;
//         double widthScreen = MediaQuery.of(context).size.width;
//         double heigthScreen = MediaQuery.of(context).size.height;

//         GlobalKey imageKey = GlobalKey();

//         WidgetsBinding.instance!.addPostFrameCallback((_) {
//           if (imageKey.currentContext != null) {
//             RenderBox renderBox =
//                 imageKey.currentContext!.findRenderObject() as RenderBox;

//             setState(() {
//               _globalPosition = renderBox.localToGlobal(Offset.zero);
//               print(
//                   "${heigthScreen - (_globalPosition?.dy ?? 0)} ${(_globalPosition?.dx ?? 0) + 46}");
//             });
//           }
//         });

//         return GestureDetector(
//           child: UnconstrainedBox(
//             child: Stack(
//               children: [
//                 Container(
//                   key: imageKey,
//                   width: 56,
//                   height: 56,
//                   margin: const EdgeInsets.only(top: 12),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(5),
//                     child: Image.file(e),
//                   ),
//                 ),
//                 Positioned(
//                   top: (heigthScreen - (_globalPosition?.dy ?? 0)),
//                   left: (widthScreen - (_globalPosition?.dx ?? 0)),
//                   child: Container(
//                     height: 15,
//                     width: 15,
//                     decoration: BoxDecoration(
//                       color: AppColors.gray,
//                       border: Border.all(color: AppColors.gray_border),
//                       borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     ),
//                     child: const Center(
//                       child: Icon(
//                         Icons.close,
//                         size: 10,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//       GestureDetector(
//         onTap: () => _getImage(),
//         child: Container(
//           margin: const EdgeInsets.only(top: 12),
//           height: 56,
//           width: 56,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(12)),
//             color: Color.fromARGB(255, 246, 246, 246),
//           ),
//           child: Center(child: SvgPicture.asset(image_cross)),
//         ),
//       ),
//     ]);
//   }

//   _removeImage(File image) {
//     setState(() {
//       _selectedImage.remove(image);
//     });
//   }

//   _getImage() async {
//     final List<File?> listFile = await galleryController.getImageFromGallery();

//     if (listFile != null) {
//       final List<File> result =
//           listFile.where((file) => file != null).cast<File>().toList();
//       widget.getImage(result);
//       setState(() {
//         _selectedImage = result;
//       });
//     }
//   }
// }
