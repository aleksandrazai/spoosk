import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoosk/core/presentation/image.dart';

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
          backgroundColor: const Color(0x00f8f8f8),
          elevation: 0,
          flexibleSpace: const FlexibleSpaceBar(
            background: CustomAppBar(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(36),
            child: CustomSearchField(
              onTap: () {},
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text("Item $index"),
              );
            },
            childCount: 15, // Example item count
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width * 0.9,
          top: 20,
          child: Image.asset(test_png_header, fit: BoxFit.cover),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width * 0.9,
          top: 32,
          child: SvgPicture.asset(image_header_slogan, fit: BoxFit.contain),
        ),
        Positioned(
          top: 28,
          right: 25 * 2.13,
          child: Image.asset(
            image_header_logo,
            width: 50,
            height: 16,
          ),
        ),
      ],
    );
  }
}
//TODO: Доделать поиск

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
        ),
        child: const Row(
          children: [
            Icon(Icons.search_rounded),
            SizedBox(width: 12),
            Text(
              'Поиск курорта...',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
