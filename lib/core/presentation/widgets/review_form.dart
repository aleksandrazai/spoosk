import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/review_button.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key, required this.resortById});
  final ResortByIdBloc resortById;

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  _ReviewFormState();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Opacity(
                  opacity: 0.40,
                  child: Container(
                    width: 32,
                    height: 4,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF79747E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 60,
                  height: 60,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Роза Хутор',
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text('Краснодарский край',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Как бы вы оценили курорт?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                onRatingUpdate: (rating) {
                  print(rating);
                }),
          ),
          const ReviewTextForm(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 36,
            child: ReviewButton(
              buttonText: 'Отправить отзыв',
              onPressedCallback: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: ((BuildContext context) {
                    return AlertDialog(
                      title: const Text('Спасибо за Ваш отзыв!'),
                      content: const Text(
                          'После модерации Ваш отзыв будет опубликован на странице курорта.'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Закрыть'))
                      ],
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewTextForm extends StatefulWidget {
  const ReviewTextForm({
    super.key,
  });

  @override
  State<ReviewTextForm> createState() => _ReviewTextFormState();
}

class _ReviewTextFormState extends State<ReviewTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20),
      height: 105,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Color(0xFFF6F6F6),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: const TextField(
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
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
    );
  }
}
