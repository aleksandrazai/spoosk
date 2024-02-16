// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/repositories/DI/service.dart';
import 'package:spoosk/core/domain/useCases/SearchHistoryUseCase.dart';
import 'package:spoosk/core/presentation/features/home/bloc/popular_resorts/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/features/home/bloc/reviews_home/reviews_home_bloc.dart';
import 'package:spoosk/core/presentation/features/home/widgets/custom_appBar.dart';
import 'package:spoosk/core/presentation/features/review/widgets/review_card/review_card.dart';
import 'package:spoosk/core/presentation/features/search/bloc/bloc_search_history/search_history_bloc.dart';
import 'package:spoosk/core/presentation/features/search/widgets/custom_searchfield.dart';
import 'package:spoosk/core/presentation/features/user/favourites/bloc/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/features/home/widgets/cardsheader.dart';
import 'package:spoosk/core/presentation/features/resort/widgets/resort_card/resort_card.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  SingletonAuthUseCase singletonAuthUseCase = SingletonAuthUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 3));
            _refreshHomeScreen();
          },
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
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
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                            ),
                            height: 36,
                            width: double.infinity,
                          ),
                          CustomSearchField(
                            disabled: true,
                            onTap: () {
                              SearchHistoryUseCase()
                                  .checkDB(context.read<SearchHistoryBloc>());
                              AutoRouter.of(context)
                                  .navigate(const SearchRoute());
                            },
                          )
                        ],
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
                    showButton: false,
                  ),
                ),
              ),
              BlocBuilder<PorularResortBloc, PorularResortState>(
                builder: (context, state) {
                  if (state is PorularResortLoaded) {
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 220, //test
                          child: ListView.builder(
                            addRepaintBoundaries: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, index) {
                              final resort = state.resortsAll[index];
                              return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: ResortCard(resort: resort));
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverToBoxAdapter();
                },
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(top: 28, bottom: 8),
                  child: const CardsHeaderPopularALL(
                    header: 'Последние отзывы',
                    showButton: false,
                  ),
                ),
              ),
              BlocBuilder<ReviewsHomeBloc, ReviewsHomeState>(
                builder: (context, state) {
                  if (state is ReviewsHomeLoaded) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.reviews!.results.length,
                        (context, index) {
                          final reviews = state.reviews!.results[index];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: ReviewCard(
                              reviews: reviews,
                              showSettings: false,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return SliverToBoxAdapter();
                },
              ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: const EdgeInsets.all(
              //       16.0,
              //     ).copyWith(bottom: 16),
              //     child: CustomButton(
              //       boxDecoration:
              //           BoxDecoration(borderRadius: BorderRadius.circular(8)),
              //       textStyle: Theme.of(context)
              //           .textTheme
              //           .labelMedium
              //           ?.copyWith(color: AppColors.white),
              //       height: 40,
              //       color: AppColors.primaryColor,
              //       onTap: () {},
              //       buttonText: "Написать отзыв",
              //     ),
              //   ),
              // ),
            ],
          )),
    );
  }
  // return Center(child: const CircularProgressIndicator());

  @override
  void initState() {
    super.initState();
    initData();
  }

// Возможно это можно будет перенести в main_screen и инициализировать вместе с навигацией
  initData() async {
    await singletonAuthUseCase.authUseCase
        .checkDB(context.read<UserProfileBloc>());
    context.read<PorularResortBloc>().add(LoadAllPorularResorts());
    context.read<ReviewsHomeBloc>().add(GetReviewsHomeEvent());
    SearchHistoryUseCase().checkDB(context.read<SearchHistoryBloc>());
    int? userId = singletonAuthUseCase.authUseCase.userId;
    if (userId != null) {
      context.read<FavoritesUsersBloc>().add(FavoritesUsersGet(userId: userId));
    }
  }

  _refreshHomeScreen() {
    context.read<PorularResortBloc>().add(LoadAllPorularResorts());
    context.read<ReviewsHomeBloc>().add(GetReviewsHomeEvent());
    setState(() {});
  }
}
