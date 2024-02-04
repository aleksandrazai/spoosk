// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/image.dart';

final GlobalKey<_CustomImageNetworkState> globalKey = GlobalKey();

class CustomImageNetwork extends StatefulWidget {
  late List<String> src;
  List<String>? listImages = [];
  int? initIndex = 1;
  double scale = 1.0;
  Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  String? semanticLabel;
  bool excludeFromSemantics = false;
  double? width;
  double? height;
  Color? color;
  Animation<double>? opacity;
  BlendMode? colorBlendMode;
  BoxFit? fit;
  AlignmentGeometry alignment = Alignment.center;
  ImageRepeat repeat = ImageRepeat.noRepeat;
  Rect? centerSlice;
  bool matchTextDirection = false;
  bool gaplessPlayback = false;
  FilterQuality filterQuality = FilterQuality.low;
  bool isAntiAlias = false;
  Map<String, String>? headers;
  int? cacheWidth;
  int? cacheHeight;
  final imageCache = ImageCache();

  CustomImageNetwork({
    super.key,
    required this.src,
    this.initIndex,
    this.listImages,
    this.scale = 1.0,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.color,
    this.opacity,
    this.colorBlendMode,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.low,
    this.isAntiAlias = false,
    this.headers,
    this.cacheWidth,
    this.cacheHeight,
  }) {}

  @override
  _CustomImageNetworkState createState() => _CustomImageNetworkState();
}

class _CustomImageNetworkState extends State<CustomImageNetwork> {
  int _indexList = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openModal,
      child: Image.network(
        widget.src[0],
        scale: widget.scale,
        frameBuilder: widget.frameBuilder,
        loadingBuilder: widget.loadingBuilder,
        errorBuilder: widget.errorBuilder,
        semanticLabel: widget.semanticLabel,
        excludeFromSemantics: widget.excludeFromSemantics,
        width: widget.width,
        height: widget.height,
        color: widget.color,
        opacity: widget.opacity,
        colorBlendMode: widget.colorBlendMode,
        fit: widget.fit,
        alignment: widget.alignment,
        repeat: widget.repeat,
        centerSlice: widget.centerSlice,
        matchTextDirection: widget.matchTextDirection,
        gaplessPlayback: widget.gaplessPlayback,
        filterQuality: widget.filterQuality,
        isAntiAlias: widget.isAntiAlias,
        headers: widget.headers,
        cacheWidth: widget.cacheHeight,
        cacheHeight: widget.cacheHeight,
      ),
    );
  }

  _openModal() async {
    final size = MediaQuery.of(context).size;
    clouseModal(BuildContext contextDialog) {
      Navigator.pop(contextDialog);
    }

    print(widget.src[0]);
    if (widget.listImages != null && widget.listImages!.isNotEmpty) {
      setState(() {
        _indexList = widget.listImages!.indexOf(widget.src[0]);
      });
    } else {
      widget.listImages = widget.src;
    }
    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (context, setState) => Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black,
                    child: Center(
                        child: CarouselSlider(
                      items: [
                        ...widget.listImages!.map((e) => Image.network(
                              e,
                              errorBuilder: (context, error, stackTrace) =>
                                  Center(
                                child: Image.asset(
                                  error_image,
                                  width: 92,
                                  height: 92,
                                ),
                              ),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                return loadingProgress == null
                                    ? child
                                    : Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                              },
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ))
                      ],
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        initialPage: _indexList,
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              _indexList = index;
                            },
                          );
                        },
                        height: 200,
                        viewportFraction: 1,
                      ),
                    )),
                  ),
                  Positioned(
                      top: 21,
                      right: 21,
                      child: GestureDetector(
                        onTap: () {
                          clouseModal(context);
                        },
                        child: const Icon(Icons.close),
                      )),
                  Positioned(
                    top: size.height * 0.71,
                    width: size.width,
                    child: Center(
                      child: Text(
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w700,
                          ),
                          '${_indexList + 1} из ${widget.listImages!.length} '),
                    ),
                  ),
                ],
              )),
    );
  }
}
