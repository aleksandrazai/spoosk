import 'package:spoosk/core/domain/useCases/AuthUseCase.dart';

// Если надо создать где то AuthUseCase, то только делаем через SingletonAuthUseCase
// При выходе в поля  int? userId; String? userToken; записываем null
class SingletonAuthUseCase {
  static final SingletonAuthUseCase _instance =
      SingletonAuthUseCase._internal();

  factory SingletonAuthUseCase() {
    return _instance;
  }

  SingletonAuthUseCase._internal();

  final AuthUseCase _authUseCase = AuthUseCase();

  AuthUseCase get authUseCase => _authUseCase;
}
