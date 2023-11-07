import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/blocs_init/bloc/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
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
          // print("resortsAll: ${state.resortsAll}");
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
                  preferredSize: const Size.fromHeight(26),
                  child: CustomSearchField(
                    onTap: () {},
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
                    width: 256,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.resortsAll.length,
                      itemBuilder: (context, index) {
                        final resort = state.resortsAll[index];
                        return ResortCard(resort: resort);
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
                      horizontal: 24.0, vertical: 8.0),
                  child: ReviewButton(
                    buttonText: 'Написать отзыв',
                    //TODO: добавить переход на поиск курорта
                    onPressedCallback: () {},
                  ),
                ),
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
