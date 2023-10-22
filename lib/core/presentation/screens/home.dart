import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import '../widgets/widgets.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
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
  List<Resorts> _resorts = [];

  @override
  void initState() {
    super.initState();
    _getAllResorts();
  }

  Future<void> _getAllResorts() async {
    final resorts = await requestController.getResortsAll(
        getAllResorts: ApiConfigurate.getAllResorts);
    if (resorts != null) {
      setState(() {
        _resorts = resorts;
      });
    }
  }

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
            height: 212, //test
            width: 256,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _resorts.length,
              itemBuilder: (context, index) {
                final resort = _resorts[index];
                return ResortCard(resort: resort);
              },
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
      ],
    );
  }
}
