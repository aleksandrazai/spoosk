import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';

import '../../data/API/RequestController.dart';
import '../../data/models/user_login.dart';

part 'new_password_event.dart';
part 'new_password_state.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  NewPasswordBloc() : super(NewPasswordInitial()) {
    RequestController requestController = RequestController();
    on<PasswordEntered>((event, emit) async {
      try {
        final UserLogin? serverResponse = await requestController.setPassword(
            password: event.password,
            id: event.id,
            setPassword: ApiConfigPost.setPassword);
        if (serverResponse!.status == 200) {
          emit(NewPasswordSuccessfull());
        }
      } catch (error) {
        print('Error in set new password: $error');
        emit(NewPasswordFailed(errorMessage: error.toString()));
      }
    });
  }
}
