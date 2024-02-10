import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../data/API/ApiConfig.dart';
import '../../data/models/user_register.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    RequestController requestController = RequestController();

    on<RegisterFormFilled>((event, emit) async {
      emit(RegisterLoading());
      try {
        final UserRegister? userRegister = await requestController.userRegister(
            email: event.email,
            password: event.password,
            name: event.name,
            userRegister: ApiConfigPost.userRegister);
        if (userRegister != null) {
          emit(RegisterSuccessfull(
              id: userRegister.id, userRegister: userRegister));
        }
      } catch (error) {
        print('Error in register: $error');
        emit(RegisterFailed(errorMessage: error.toString()));
      }
    });
  }
}
