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
          backgroundColor: const Color(0xF8F8F8),
          elevation: 0,
          flexibleSpace: const FlexibleSpaceBar(
            background: CustomAppBar(),
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
          right: 25,
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

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(); //TODO
  }
}
