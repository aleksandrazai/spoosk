import 'dart:core';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet.dart';
import 'package:spoosk/core/presentation/widgets/custom_dialog.dart';
import 'package:spoosk/core/presentation/widgets/review_actionButton.dart';
import 'package:spoosk/core/presentation/widgets/separator.dart';
import '../../data/models/reviews.dart';
import '../image.dart';
import 'hide_text_overflow.dart';
import 'rating_stars.dart';

class ReviewCard extends StatelessWidget {
  final Review reviews;
  final bool showSettings;

  const ReviewCard({
    super.key,
    required this.reviews,
    required this.showSettings,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? addAt = reviews.addAt;

    String formattedDate =
        addAt != null ? DateFormat('dd.MM.yy').format(addAt) : '';
    return Card(
      margin: context.router.current.name == "Home"
          ? const EdgeInsets.fromLTRB(16, 8, 16, 8)
          : null,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      width: 41,
                      height: 41,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(84),
                        ),
                      ),
                      child: Image.asset(image_avatar_placeholder),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${reviews.authorName} ${reviews.authorLastname}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          formattedDate,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  if (showSettings)
                    Transform.translate(
                      offset: const Offset(-12, -12),
                      child: reviews.approved == true
                          ? ReviewActionIcon(
                              onTapped: () {}, icon: image_review_delete)
                          : ReviewActionIcon(
                              onTapped: () {
                                CustomBottomSheet.customShowModalBottomSheet(
                                    context: context,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.15,
                                    children: [
                                      ReviewSettings(reviews: reviews),
                                    ]);
                              },
                              icon: image_review_settings),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        reviews.resortName ?? "",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RatingStars(rating: reviews.rating ?? 0)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SizedBox(
                  child: HideTextOverflow(
                      fullText: reviews.text ?? "", maxSymbols: 170),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...(reviews.images ?? []).map((e) => Container(
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            height: 72,
                            width: 120,
                            child: Image.network(e.image, fit: BoxFit.cover),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewSettings extends StatelessWidget {
  ReviewSettings({super.key, required this.reviews});
  final RequestController _requestController = RequestController();
  final Review reviews;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Редактировать отзыв'),
          ),
          const Separator(),
          TextButton(
              onPressed: () {
                CustomDialog.showCustomDialog(
                  actions: [
                    TextButton(
                        onPressed: () {
                          _requestController.deleteReviews(reviews.id!);
                        },
                        child: const Text('Удалить')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Закрыть'))
                  ],
                  context: context,
                  title: 'Удалить отзыв',
                  bodyText: 'Вы уверены, что хотите удалить отзыв?',
                );
              },
              child: const Text('Удалить отзыв'))
        ],
      ),
    );
  }
}
