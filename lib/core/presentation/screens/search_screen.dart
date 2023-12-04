import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: false,
          pinned: true,
          backgroundColor: const Color(0xFFf8f8f8),
          elevation: 0,
          leadingWidth: 28,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                AutoRouter.of(context).navigate(const Home());
              },
              child: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                image_arrow_left,
                width: 9.33,
                height: 16.33,
              ),
            ),
          ),
          iconTheme: Theme.of(context).iconTheme,
          title: const CustomSearchField(
            disabled: false,
            autofocus: true,
          ),
        ),
      ],
    );
  }
}
