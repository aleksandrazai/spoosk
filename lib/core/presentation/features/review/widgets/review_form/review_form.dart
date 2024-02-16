import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/data/models/test_reviews.dart';
import 'package:spoosk/core/presentation/features/user/reviews/bloc_user_reviews/user_reviews_bloc.dart';

import 'package:spoosk/core/presentation/widgets/custom_bottomSheet.dart';
import 'package:spoosk/core/presentation/widgets/CustomImageNetwork.dart';
import '../../../../../colors.dart';
import '../../../../../data/models/ResortById.dart';
import '../../../../image.dart';
import '../../../../widgets/CustomButton.dart';
import 'Image_picker.dart';

import '../../../../../utils/context.dart';

class ReviewForm extends StatefulWidget {
  final ResortById resort;
  final Review? review;

  const ReviewForm({
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
    return SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewInsets.top,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
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
                            height: 60,
                            width: 60,
                            openGallery: false,
                            fit: BoxFit.fill,
                            src: [widget.resort.mainResortImg]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.resort.name,
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
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
                    height: 105,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: const Color(0xFFF6F6F6),
                    ),
                    child: SizedBox(
                      child: TextField(
                        controller: _textEditingController,
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(56, 217, 217, 217),
                          border: InputBorder.none,
                          filled: true,
                          hintText:
                              'Дополни свою оценку отзывом - это поможет другим райдерам определится с выбором курорта',
                          hintMaxLines: 5,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: const Color(0xFF696969)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      style: Theme.of(context).textTheme.bodyMedium,
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28, top: 24),
                    child: CustomButton(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.white, fontSize: 16),
                        boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
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
          ),
        ));
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
