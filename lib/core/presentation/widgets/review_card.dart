import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/reviews.dart';
import '../image.dart';
import 'hide_text_overflow.dart';
import 'rating_stars.dart';

class ReviewCard extends StatelessWidget {
  final Review reviews;
  const ReviewCard({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? addAt = reviews.addAt;

    String formattedDate =
        addAt != null ? DateFormat('dd.MM.yy').format(addAt!) : '';
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
                            child: Image.network(e!.image, fit: BoxFit.cover),
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
