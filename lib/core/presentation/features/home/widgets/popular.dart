import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/features/home/bloc/popular_resorts/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/features/resort/widgets/resort_card/resort_card.dart';

GlobalKey popularGlobal = GlobalKey<_PopularHomeState>();

class PopularHome extends StatefulWidget {
  const PopularHome({Key? key}) : super(key: key);

  @override
  _PopularHomeState createState() => _PopularHomeState();
}

class _PopularHomeState extends State<PopularHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PorularResortBloc, PorularResortState>(
      builder: (context, state) {
        if (state is PorularResortLoaded) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 220, //test
                child: ListView.builder(
                  addRepaintBoundaries: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, index) {
                    final resort = state.resortsAll[index];
                    return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ResortCard(resort: resort));
                  },
                ),
              ),
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
