import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/reviews.dart';

part 'reviews_state.dart';
part 'reviews_event.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  RequestController requestController = RequestController();
  ReviewsBloc() : super(ReviewsInitial()) {
    on<LoadReviews>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Review>? reviews = await requestController.getReviews(
              getReviews: ApiConfigurateGet.getReviews);
          print(reviews!.length);
          if (reviews!.isNotEmpty) {
            emit(ReviewsLoaded(reviewsAll: reviews));
          }
        }
      } catch (e) {
        emit(ReviewsLoaded(reviewsAll: []));
      }
    });
  }
}
