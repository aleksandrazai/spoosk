// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/domain/useCases/SearchHistoryUseCase.dart';
import 'package:spoosk/core/presentation/bloc_reviews_home/reviews_home_bloc.dart';
import 'package:spoosk/core/presentation/bloc_search_history/search_history_bloc.dart';
import 'package:spoosk/core/presentation/blocs_init/bloc/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';

import '../widgets/widgets.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RequestController requestController = RequestController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final stateResorts = context.watch<RequestControllerBloc>().state;
        final stateReviews = context.watch<ReviewsHomeBloc>().state;
        print(stateResorts is RequestControllerLoaded);
        print(stateResorts);
        if (stateResorts is RequestControllerLoaded &&
            stateReviews is ReviewsHomeLoaded) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.3,
                  floating: false,
                  pinned: true,
                  backgroundColor: const Color(0xFFf8f8f8),
                  elevation: 0,
                  flexibleSpace: Container(
                    color: AppColors.background,
                    child: const FlexibleSpaceBar(
                      background: CustomAppBar(),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(15),
                    child: Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomSearchField(
                          disabled: true,
                          onTap: () {
                            SearchHistoryUseCase()
                                .checkDB(context.read<SearchHistoryBloc>());
                            AutoRouter.of(context)
                                .navigate(const SearchRoute());
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0)
                        .copyWith(top: 20, bottom: 8),
                    child: const CardsHeaderPopularALL(
                      header: 'Популярные курорты',
                      all: 'Все',
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 220, //test
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          final resort = stateResorts.resortsAll[index];
                          return SizedBox(
                              width: 285, child: ResortCard(resort: resort));
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(top: 28, bottom: 8),
                    child: const CardsHeaderPopularALL(
                      header: 'Последние отзывы',
                      all: '',
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: stateReviews.reviews!.results.length,
                    (context, index) {
                      final reviews = stateReviews.reviews!.results[index];
                      return ReviewCard(reviews: reviews);
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ).copyWith(bottom: 16),
                    child: CustomButton(
                      boxDecoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
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
                ),
              ],
            ),
          );
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
