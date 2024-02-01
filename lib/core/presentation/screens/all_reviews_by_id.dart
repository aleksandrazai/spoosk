import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/models/reviews.dart';
import '../image.dart';
import '../routes.gr.dart';
import '../widgets/widgets.dart';

@RoutePage()
class AllReviewsById extends StatefulWidget {
  const AllReviewsById({super.key, required this.reviews});
  final List<Review>? reviews;

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
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.reviews?.length,
                itemBuilder: (context, index) {
                  final review = widget.reviews![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ReviewCard(
                      reviews: review,
                      showSettings: false,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
