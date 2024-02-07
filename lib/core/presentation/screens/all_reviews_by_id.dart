import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/utils/utils.dart';
import '../../data/models/reviews.dart';
import '../image.dart';
import '../widgets/widgets.dart';

@RoutePage()
class AllReviewsById extends StatefulWidget {
  final List<Review>? reviews;
  final ResortById? resort;
  const AllReviewsById({super.key, required this.reviews, this.resort});

  @override
  State<AllReviewsById> createState() => _AllReviewsByIdState();
}

class _AllReviewsByIdState extends State<AllReviewsById> {
  bool _seeNameResort = false;
  final textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
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
      body: Expanded(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 21),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontSize: 24),
                              widget.resort!.name),
                          Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 8),
                            child: Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontSize: 32),
                                widget.resort!.rating.toDouble().toString()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                  widget.resort!.rating.toInt(),
                                  (index) => SvgPicture.asset(
                                      width: 28, height: 28, image_star))
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w400),
                              declensionWords(widget.reviews!.length)
                                  .toString()),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: CustomButton(
                              boxDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.white),
                              height: 40,
                              color: AppColors.primaryColor,
                              onTap: () {
                                _showModalBottomSheet(widget.resort);
                              },
                              buttonText: "Написать отзыв",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ...widget.reviews!.map((review) => ReviewCard(
                        reviews: review,
                        showSettings: false,
                      ))
                ],
              ),
            )),
      ),
    );
  }

  _showModalBottomSheet(resort) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        useRootNavigator: true,
        useSafeArea: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return ReviewForm(
            resort: resort,
          );
        });
  }
}
