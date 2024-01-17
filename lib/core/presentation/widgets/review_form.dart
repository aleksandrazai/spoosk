import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/test_reviews.dart';
import '../../colors.dart';
import '../../data/models/ResortById.dart';
import '../image.dart';
import 'CustomButton.dart';
import 'Image_picker.dart';
import 'widgets.dart';
import '../../utils/context.dart';

class ReviewForm extends StatefulWidget {
  ResortById? resort;
  Key? scaffoldKey;

  ReviewForm({
    super.key,
    required this.resort,
    this.scaffoldKey,
  });

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  List<File> selectedImage = [];

  final TextEditingController _textEditingController = TextEditingController();
  double _rating = 1;
  final RequestController _requestController = RequestController();

  _ReviewFormState();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModalHandle(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.blue),
                  child: Image.network(
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(Icons.close_rounded),
                          ),
                      height: 60,
                      width: 60,
                      fit: BoxFit.fill,
                      widget.resort!.mainResortImg),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.resort!.name,
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text(widget.resort!.region,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Как бы вы оценили курорт?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: RatingBar.builder(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return SvgPicture.asset(
                      image_star,
                      height: 32,
                      width: 32,
                    );
                  },
                  onRatingUpdate: _setRating),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20),
              height: 105,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xFFF6F6F6),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _textEditingController,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    fillColor: Color(0xFFF6F6F6),
                    border: InputBorder.none,
                    filled: true,
                    hintText:
                        'Дополни свою оценку отзывом - это поможет другим райдерам определится с выбором курорта',
                    hintMaxLines: 5,
                    hintStyle: TextStyle(
                      color: Color(0xFF9B9CA0),
                      fontSize: 14,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryFontLight),
                "Дополни свой отзыв фотографиями"),
            Wrap(
              spacing: 12,
              children: [
                ...selectedImage.map((e) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(top: 12),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Image.file(
                        fit: BoxFit.cover, width: 56, height: 56, File(e.path)),
                  );
                }),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: ImagePicker(
                    getImage: (listImage) async {
                      final List<File> result =
                          // ignore: prefer_collection_literals
                          Set<File>.from([...selectedImage, ...listImage])
                              .toList();

                      setState(() {
                        selectedImage = result;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 36,
              child: CustomButton(
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.white, fontSize: 16),
                boxDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 36,
                color: AppColors.primaryColor,
                buttonText: "Отправить отзыв",
                onTap: () => _sendReviews(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setRating(double rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _sendReviews(BuildContext context) {
    print(context.userInfo.getUserInfo());

    if (context.userInfo.getUserInfo() != null &&
        _textEditingController.text.isNotEmpty) {
      if (selectedImage.isNotEmpty) {
        TestReviews reviews = TestReviews(
            resort: widget.resort!.idResort,
            text: _textEditingController.text,
            rating: _rating.toInt(),
            images: selectedImage);

        _requestController.postReviews(reviews);
        _showDialog(content: "Отзыв на модерации");
      } else if (context.userInfo.getUserInfo() == null) {
        _showDialog(content: "Требуется авторизация", title: "Ошибка");
      } else if (_textEditingController.text.isEmpty) {
        _showDialog(content: "Введите отзыв", title: "Ошибка");
      } else {
        print("Error: No images selected");
      }
    }
  }

  _showDialog(
      {required String content, String title = 'Спасибо за Ваш отзыв!'}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: ((BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Закрыть'))
          ],
        );
      }),
    );
  }
}
