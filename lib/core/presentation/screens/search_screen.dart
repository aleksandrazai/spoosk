import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/bloc_search/search_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(
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
      body: BlocBuilder<SearchResortBloc, SearchResortState>(
        builder: (context, state) {
          return SearchResult(state: state);
        },
      ),
    );
  }
}

class SearchResult extends StatefulWidget {
  const SearchResult({
    super.key,
    required this.state,
  });
  final SearchResortState state;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late final SearchResortBloc searchResortBloc;

  @override
  void initState() {
    super.initState();
    searchResortBloc = context.read<SearchResortBloc>();
  }

  @override
  Widget build(BuildContext context) {
    print('SearchBlocState: ${widget.state}');
    if (widget.state is SearchResortInitial) {
      return Text('State: ${widget.state.resortsFound.length}');
    }
    if (widget.state is SearchResortLoaded) {
      final state = widget.state as SearchResortLoaded;
      return Column(
        children: [
          Text('Найдено курортов - ${state.resortsFound.length}'),
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: state.resortsFound.length,
              itemBuilder: (context, index) {
                final resort = state.resortsFound[index];
                return SizedBox(width: 285, child: ResortCard(resort: resort));
              },
            ),
          ),
        ],
      );
    }
    if (widget.state is SearchResortNotFound) {
      return const Text('Ничего не найдено');
    }
    return const CircularProgressIndicator();
  }
}
