import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/reviews.dart';

part 'reviews_by_id_event.dart';
part 'reviews_by_id_state.dart';

class ReviewsByIdBloc extends Bloc<ReviewsByIdEvent, ReviewsByIdState> {
  ReviewsByIdBloc() : super(ReviewsByIdInitial()) {
    RequestController requestController = RequestController();

    on<ClearReviewsById>(_onClearReviews);

    on<EventLoadByIdReviews>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Reviews>? reviewsAll =
              await requestController.getReviewsById(
                  id: event.idResort,
                  getReviewsById: ApiConfigurate.getReviewsById);

          if (reviewsAll != null) {
            emit(ReviewsByIdLoaded(reviews: reviewsAll));
          }
        }
      } catch (e) {
        print("ReviewsByIdBloc: $e");
      }
    });
  }

  void _onClearReviews(ClearReviewsById event, Emitter<ReviewsByIdState> emit) {
    emit(ReviewsByIdInitial());
  }
}
