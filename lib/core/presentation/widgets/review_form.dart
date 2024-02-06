import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/data/models/test_reviews.dart';
import 'package:spoosk/core/presentation/bloc_user_reviews/user_reviews_bloc.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet.dart';
import 'package:spoosk/core/presentation/widgets/CustomImageNetwork.dart';
import '../../colors.dart';
import '../../data/models/ResortById.dart';
import '../image.dart';
import 'CustomButton.dart';
import 'Image_picker.dart';

import '../../utils/context.dart';

class ReviewForm extends StatefulWidget {
  ResortById resort;
  Review? review;

  ReviewForm({
    super.key,
    required this.resort,
    this.review,
  });

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  List<File> selectedImage = [];

  TextEditingController _textEditingController = TextEditingController();
  num _rating = 1;
  final RequestController _requestController = RequestController();

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.review?.text ?? '');
    _rating = widget.review?.rating ?? 1;
  }

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
                  child: CustomImageNetwork(
                      listImages: [widget.resort.image],
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(Icons.close_rounded),
                          ),
                      height: 60,
                      width: 60,
                      fit: BoxFit.fill,
                      src: [widget.resort.mainResortImg]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.resort.name,
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text(widget.resort.region,
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
                  initialRating: widget.review?.rating?.toDouble() ?? 0,
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
                ImagePicker(
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
                  onTap: () {
                    if (widget.review?.id == null) {
                      _sendReviews(context);
                    }
                    _sendEditedReviews();
                  }),
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
      TestReviews reviews = TestReviews(
          resort: widget.resort.idResort,
          text: _textEditingController.text,
          rating: _rating.toInt(),
          images: selectedImage);

      _requestController.postReviews(reviews);
      _showDialog(content: "Отзыв на модерации");
    } else if (context.userInfo.getUserInfo() == null) {
      _showDialog(content: "Требуется авторизация", title: "Ошибка");
    } else if (_textEditingController.text.isEmpty) {
      _showDialog(content: "Введите отзыв", title: "Ошибка");
    }
  }

  void _sendEditedReviews() {
    TestReviews editedReview = TestReviews(
        resort: widget.resort.idResort,
        text: _textEditingController.text,
        rating: _rating.toInt(),
        images: []);
    _requestController.editReviews(editedReview, widget.review!.id!);
    _showDialog(content: "Отзыв на модерации");
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
                  context.read<UserReviewsBloc>().add(LoadUserReviews(
                      id: context.userInfo.getUserInfo()!.userProfile.id));
                  CustomBottomSheet.closeModalBottomSheet(context);
                  Navigator.of(context).pop();
                },
                child: const Text('Закрыть'))
          ],
        );
      }),
    );
  }
}
