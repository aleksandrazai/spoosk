import 'package:auto_route/auto_route.dart';
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
      margin: context.router.current.name == "Home"
          ? const EdgeInsets.all(16.0)
          : null,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Александр В.',
                          style: TextStyle(
                            color: Color(0xFF4D4E50),
                            fontSize: 16,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '23.12.2023',
                          style: TextStyle(
                            color: Color(0xFF9B9CA0),
                            fontSize: 12,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Роза хутор',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StarIcon(),
                        StarIcon(),
                        StarIcon(),
                        StarIcon(),
                        StarIcon(),
                      ],
                    ),
                  ),
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
