import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../data/API/ApiConfig.dart';
import '../../data/models/user_login.dart';

part 'reset_event.dart';
part 'reset_state.dart';

class ResetBloc extends Bloc<ResetEvent, ResetState> {
  ResetBloc() : super(ResetInitial()) {
    RequestController requestController = RequestController();
    on<ResetRequested>((event, emit) async {
      try {
        final UserData? userData = await requestController.passwordReset(
            email: event.email, passwordReset: ApiConfigPost.passwordReset);
        if (userData != null) {
          emit(ResetSuccessfull(id: userData.id!));
        }
      } catch (error) {
        print('Error in reset: $error');
        emit(ResetFailed(errorMessage: error.toString()));
      }
    });
  }
}
