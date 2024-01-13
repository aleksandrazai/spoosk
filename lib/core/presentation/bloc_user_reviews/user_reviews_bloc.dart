import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../data/models/reviews.dart';

part 'user_reviews_event.dart';
part 'user_reviews_state.dart';

class UserReviewsBloc extends Bloc<UserReviewsEvent, UserReviewsState> {
  UserReviewsBloc() : super(UserReviewsInitial()) {
    on<LoadUserReviews>(_onLoadReviews);
  }

  void _onLoadReviews(
      LoadUserReviews event, Emitter<UserReviewsState> emit) async {
    RequestController requestController = RequestController();
    try {
      final Reviews? reviews = await requestController.getUserReviews(
          id: event.id, getUserReviews: ApiConfigurateGet.getUserReviews);

      if (reviews != null) {
        emit(UserReviewsLoaded(reviews: reviews));
      } else {
        emit(UserReviewsFailed());
      }
    } catch (e) {
      print("ReviewsByUserBloc: $e");
    }
  }
}
