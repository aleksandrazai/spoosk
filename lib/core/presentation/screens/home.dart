import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/colors.dart';

import 'package:spoosk/core/presentation/blocs_init/bloc/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import '../widgets/widgets.dart';
import 'package:spoosk/core/data/RequestController.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
    return BlocBuilder<RequestControllerBloc, RequestControllerState>(
      builder: (context, state) {
        if (state is RequestControllerLoaded) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                floating: false,
                pinned: true,
                backgroundColor: const Color(0xFFf8f8f8),
                elevation: 0,
                flexibleSpace: const FlexibleSpaceBar(
                  background: CustomAppBar(),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(15),
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomSearchField(),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: CardsHeaderPopularALL(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 212, //test
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final resort = state.resortsAll[index];
                        return SizedBox(
                            width: 285, child: ResortCard(resort: resort));
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <ReviewCard>[
                      ...List.filled(6, false).map((e) => const ReviewCard())
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
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
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
