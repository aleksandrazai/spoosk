import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/blocs/bloc/request_controller_bloc.dart';
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
                    onPressedCallback: () {
                      openReviewForm(context);
                    },
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

  Future<dynamic> openReviewForm(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return ReviewForm();
        });
  }
}

class ReviewButton extends StatelessWidget {
  const ReviewButton(
      {super.key, required this.onPressedCallback, required this.buttonText});
  final VoidCallback? onPressedCallback;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressedCallback,
      child: Text(buttonText),
    );
  }
}

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Opacity(
                  opacity: 0.40,
                  child: Container(
                    width: 32,
                    height: 4,
                    decoration: ShapeDecoration(
                      color: Color(0xFF79747E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 60,
                  height: 60,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.blue),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Роза Хутор',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('Краснодарский край',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Как бы вы оценили курорт?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                RatingBar.builder(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) {
                      return SvgPicture.asset(
                        image_star,
                        height: 32,
                        width: 32,
                      );
                    },
                    onRatingUpdate: (rating) {
                      print(rating);
                    }),
                Container(
                  height: 105,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Color(0xFFF6F6F6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 310,
                        child: Text(
                          'Дополни свою оценку отзывом - это поможет другим райдерам определится с выбором курорта',
                          style: TextStyle(
                            color: Color(0xFF9B9CA0),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Дополни свой отзыв фотографиями',
                  style: TextStyle(
                    color: Color(0xFF4C4E4F),
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
