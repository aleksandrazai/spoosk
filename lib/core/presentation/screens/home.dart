// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/repositories/DI/service.dart';
import 'package:spoosk/core/domain/useCases/SearchHistoryUseCase.dart';
import 'package:spoosk/core/presentation/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/bloc_reviews_home/reviews_home_bloc.dart';
import 'package:spoosk/core/presentation/bloc_search_history/search_history_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/blocs_init/bloc/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/home_screen_widgets/home_popular.dart';

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
  SingletonAuthUseCase singletonAuthUseCase = SingletonAuthUseCase();

  RequestController requestController = RequestController();

  @override
  Widget build(BuildContext context) {
    UserProfileBloc userBloc = context.read<UserProfileBloc>();
    final stateReviews = context.read<ReviewsHomeBloc>();
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
                      AutoRouter.of(context).navigate(const SearchRoute());
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
                showButton: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 220, //test
                child: BlocConsumer<PorularResortBloc, PorularResortState>(
                  listener: (context, state) {
                    print("state меняется ${state}");
                  },
                  builder: (context, state) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        ...state.resortsAll
                            .map((e) => SizedBox(width: 285, child: e))
                      ]),
                    );
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
                showButton: false,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: stateReviews.state.reviews?.results.length ?? 0,
              (context, index) {
                final reviews = stateReviews.state.reviews!.results[index];
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
}
