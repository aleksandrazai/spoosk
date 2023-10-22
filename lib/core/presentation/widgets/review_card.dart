import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/hide_text_overflow.dart';
import 'package:spoosk/core/presentation/widgets/star_icon.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });
  final reviewText =
      'Горнолыжный курорт Роза Хутор оставил у меня невероятно яркие впечатления! Это место идеально подходит как для опытных лыжников, так и для новичков. Отлично подготовленные трассы, красивейшие пейзажи и современная инфраструктура, включая уютные рестораны и гостиницы, создают идеальные условия для отдыха на горнолыжных склонах. Роза Хутор - это место, где можно насладиться зимними видами спорта и природой, не ощущая ни малейшего дискомфорта.';
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Александр В.',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                        '23.12.2023',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Роза хутор',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const StarIcon(),
                  const StarIcon(),
                  const StarIcon(),
                  const StarIcon(),
                  const StarIcon(),
                ],
              ),
              SizedBox(
                child: HideTextOverflow(fullText: reviewText, maxSymbols: 170),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
