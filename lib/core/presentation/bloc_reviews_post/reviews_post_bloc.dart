import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/reviews.dart';

part 'reviews_post_event.dart';
part 'reviews_post_state.dart';

class ReviewsPostBloc extends Bloc<ReviewsPostEvent, ReviewsPostState> {
  ReviewsPostBloc() : super(ReviewsPostInitial()) {
    on<ReviewsPostEvent>((event, emit) {});
    on<ReviewsPostSend>((event, emit) {});
  }
}
