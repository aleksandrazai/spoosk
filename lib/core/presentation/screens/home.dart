import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
          child: SizedBox(
            height: 260, //test
            width: MediaQuery.of(context).size.width * 0.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ResortCard();
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (context, index) {
                return const ReviewCard();
              },
            ),
          ),
        ),
      ],
    );
  }
}
