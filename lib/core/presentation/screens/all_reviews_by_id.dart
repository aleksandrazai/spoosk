import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';

@RoutePage()
class AllReviewsById extends StatefulWidget {
  const AllReviewsById({super.key, required this.reviews});
  final Reviews reviews;

  @override
  State<AllReviewsById> createState() => _AllReviewsByIdState();
}

class _AllReviewsByIdState extends State<AllReviewsById> {
  bool _seeNameResort = false;
  final textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFf8f8f8),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: SvgPicture.asset(
              fit: BoxFit.scaleDown,
              image_arrow_left,
              width: 9.33,
              height: 16.33,
            ),
          ),
          title: Text(
            'Отзывы',
            style: Theme.of(context).textTheme.headlineMedium,
          )),
      body: Column(
        children: [
          ListView.builder(itemBuilder: (context, index) {
            final review = widget.reviews;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ReviewCard(reviews: review),
            );
          })
        ],
      ),
    );
  }
}