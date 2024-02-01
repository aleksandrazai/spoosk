import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/presentation/bloc_user_reviews/user_reviews_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';
import 'package:spoosk/core/utils/context.dart';

@RoutePage()
class UserReviews extends StatefulWidget {
  const UserReviews({super.key});

  @override
  State<UserReviews> createState() => _UserReviewsState();
}

class _UserReviewsState extends State<UserReviews> {
  @override
  void initState() {
    super.initState();
    context.read<UserReviewsBloc>().add(
        LoadUserReviews(id: context.userInfo.getUserInfo()!.userProfile.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.background,
            titleTextStyle: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w700,
            ),
            leading: CustomLeadingIcon(
              onTapped: () {
                context.router.back();
              },
            ),
            title: Text('Мои отзывы',
                style: Theme.of(context).textTheme.headlineMedium)),
        body: BlocBuilder<UserReviewsBloc, UserReviewsState>(
          builder: (context, state) {
            if (state is UserReviewsLoaded) {
              List<Review>? approvedReviews = state.reviews?.results
                  .where((review) => review.approved == true)
                  .toList();
              List<Review>? unapprovedReviews = state.reviews?.results
                  .where((review) => review.approved == false)
                  .toList();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ожидают публикации',
                          style: Theme.of(context).textTheme.headlineMedium),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: unapprovedReviews!.length,
                        itemBuilder: (context, index) {
                          final reviews = unapprovedReviews[index];
                          return ReviewCard(
                            reviews: reviews,
                            showSettings: true,
                          );
                        },
                      ),
                      SizedBox(height: 12),
                      Text('Опубликованы',
                          style: Theme.of(context).textTheme.headlineMedium),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: approvedReviews!.length,
                        itemBuilder: (context, index) {
                          final reviews = approvedReviews[index];
                          return ReviewCard(
                            reviews: reviews,
                            showSettings: true,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          16.0,
                        ).copyWith(bottom: 16),
                        child: CustomButton(
                          boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: AppColors.white),
                          height: 40,
                          color: AppColors.primaryColor,
                          onTap: () {},
                          buttonText: "Написать отзыв",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(child: Text('Нет отзывов'));
          },
        ));
  }
}
