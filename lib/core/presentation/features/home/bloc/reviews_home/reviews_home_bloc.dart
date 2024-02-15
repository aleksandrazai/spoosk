import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/reviews.dart';

part 'reviews_home_event.dart';
part 'reviews_home_state.dart';

class ReviewsHomeBloc extends Bloc<ReviewsHomeEvent, ReviewsHomeState> {
  RequestController requestController = RequestController();
  ReviewsHomeBloc() : super(ReviewsHomeInitial()) {
    on<GetReviewsHomeEvent>((event, emit) async {
      print("WORK");
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final Reviews? reviews = await requestController.getReviewsHome();
          print("ReviewsResponse: ${reviews}");
          emit(ReviewsHomeLoaded(reviews: reviews));
        }
      } catch (e) {
        print("ReviewsHomeBloc: $e");
      }
    });
  }
}
