import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc_reviews_by_id/reviews_by_id_bloc.dart';
import '../bloc_search/search_bloc.dart';
import '../image.dart';
import '../routes.gr.dart';
import 'search_screen/search_history.dart';
import 'search_screen/search_result.dart';
import '../widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f8f8),
        elevation: 0,
        leadingWidth: 28,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              context.read<SearchResortBloc>().add(ClearText());
              context.read<ReviewsByIdBloc>().add(ClearReviewsById());
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
      body: BlocBuilder<SearchResortBloc, SearchResortState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 8),
            child: SearchResult(state: state),
          );
        },
      ),
    );
  }
}
