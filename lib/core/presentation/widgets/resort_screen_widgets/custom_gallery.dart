import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';

class CustomGallery extends StatefulWidget {
  List<String> listUrl;
  CustomGallery({super.key, required this.listUrl});

  @override
  _CustomGalleryState createState() => _CustomGalleryState();
}

class _CustomGalleryState extends State<CustomGallery> {
  CarouselController carouselController = CarouselController();
  int indexList = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
          ),
          height: 200,
          child: CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  print(index);
                  setState(() {
                    indexList = index + 1;
                  });
                },
                height: 200,
                viewportFraction: 1,
              ),
              carouselController: carouselController,
              items: [
                ...widget.listUrl.map((e) => Image.network(
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                            color: AppColors.primaryColor,
                            size: 20,
                            Icons.close_rounded),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                      },
                      width: MediaQuery.of(context).size.width,
                      e,
                      fit: BoxFit.fill,
                    ))
              ]),
        ),
        Positioned(
            bottom: 8,
            right: 12,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.23999999463558197),
                    borderRadius: BorderRadius.circular(9)),
                width: 46,
                height: 32,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w700,
                        ),
                        "$indexList / ${widget.listUrl.length}"),
                  ],
                )))
      ],
    );
  }
}
