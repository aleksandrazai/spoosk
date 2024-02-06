import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet.dart';
import 'package:spoosk/core/presentation/widgets/custom_dialog.dart';
import 'package:spoosk/core/presentation/widgets/separator.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';

class ReviewSettings extends StatelessWidget {
  ReviewSettings({super.key, required this.reviews});
  final RequestController _requestController = RequestController();
  final Review reviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              final bloc = context.read<ResortByIdBloc>();
              bloc.add(EventLoadByIdResort(idResort: reviews.resort));

              CustomBottomSheet.customShowModalBottomSheet(
                  context: context,
                  children: [
                    BlocBuilder<ResortByIdBloc, ResortByIdState>(
                      builder: (context, state) {
                        if (state is ResortByIdLoaded) {
                          return ReviewForm(
                            resort: state.resortById!,
                            review: reviews,
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  ]);
            },
            child: const Text('Редактировать отзыв'),
          ),
          const Separator(),
          TextButton(
              onPressed: () {
                CustomDialog.showCustomDialog(
                  actions: [
                    TextButton(
                        onPressed: () {
                          _requestController.deleteReviews(reviews.id!);
                          CustomBottomSheet.closeModalBottomSheet(context);
                          context.router.pop();
                        },
                        child: const Text('Удалить')),
                    TextButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: const Text('Закрыть'))
                  ],
                  context: context,
                  title: 'Удалить отзыв',
                  bodyText: 'Вы уверены, что хотите удалить отзыв?',
                );
              },
              child: const Text('Удалить отзыв'))
        ],
      ),
    );
  }
}
