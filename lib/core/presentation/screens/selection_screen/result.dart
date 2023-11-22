import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_mainFilter.dart/mainFilter_bloc.dart';
import 'package:spoosk/core/presentation/widgets/resort_card.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<MainFilterBloc, MainFilterState>(
              builder: (context, state) {
            if (state is MainFilterLoaded) {
              return Column(
                children: [
                  Text('Найдено ${state.resortsMainFilter.length} курортов',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      //TODO: надо задать правильную высоту
                      height: MediaQuery.of(context).size.height - 161,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.resortsMainFilter.length,
                        itemBuilder: (context, index) {
                          final resort = state.resortsMainFilter[index];
                          return ResortCard(resort: resort);
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
        ],
      ),
    );
  }
}
