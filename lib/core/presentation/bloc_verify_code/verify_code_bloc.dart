import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../data/models/user_login.dart';

part 'verify_code_event.dart';
part 'verify_code_state.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  RequestController requestController = RequestController();
  VerifyCodeBloc() : super(VerifyCodeInitial()) {
    on<EnterCode>((event, emit) async {
      try {
        final UserData? userData = await requestController.verifyCode(
            verifyCode: ApiConfigPost.verifyCode,
            code: event.code,
            id: event.id);
        if (userData != null) {
          emit(VerifyCodeSuccessfull(id: userData.id!, userdata: userData));
        } else {
          emit(VerifyCodeFailed());
        }
      } catch (error) {
        emit(VerifyCodeFailed());
      }
    });
  }
}
