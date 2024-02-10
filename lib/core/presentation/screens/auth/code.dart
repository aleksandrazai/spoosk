import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:spoosk/core/presentation/widgets/loading_overlay.dart';
import '../../../colors.dart';
import '../../bloc_user_by_id/user_bloc.dart';
import '../../bloc_verify_code/verify_code_bloc.dart';
import '../../routes.gr.dart';
import '../../theme/theme.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/custom_leading.dart';

@RoutePage()
class EnterCodeScreen extends StatefulWidget {
  EnterCodeScreen({super.key, required this.sourcePage, required this.id});
  String sourcePage;
  int id;
  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    pinController.addListener(_clearErrorMessage);
  }

  void _clearErrorMessage() {
    if (errorMessage.isNotEmpty) {
      setState(() {
        errorMessage = '';
      });
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String messageText;
    String buttonText;
    late void Function(String?) route;
    late VoidCallback bloc;

    const String registerText =
        'Для завершения регистрации введите код, который мы выслали на вашу электронную почту';
    const String resetText =
        'Для сброса пароля введите код, который мы выслали на вашу электронную почту';
    const String registerButton = 'Зарегистрироваться';
    const String resetButton = 'Сбросить пароль';

    final isRegistration = widget.sourcePage == 'Регистрация';
    messageText = isRegistration ? registerText : resetText;
    buttonText = isRegistration ? registerButton : resetButton;

    route = isRegistration
        ? (token) => context.router.push(const UserProfileRoute())
        : (String? token) {
            context.router
                .push(ChangePasswordRoute(id: widget.id, token: token!));
          };

    bloc = isRegistration
        ? () =>
            context.read<UserProfileBloc>().add(GetUserInfo(userId: widget.id))
        : () {};

    const focusedBorderColor = Color(0xFF005FF9);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(15, 15, 220, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.background,
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontFamily: fontFamily,
            fontWeight: FontWeight.w700,
          ),
          leading: CustomLeadingIcon(
            onTapped: () {
              context.router.pop();
            },
          ),
          title: Text('Введите код',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: BlocListener<VerifyCodeBloc, VerifyCodeState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccessfull) {
            _loadingOverlay.hide();
            final token = state.userdata.token;
            route(token);
            bloc();
          }
          if (state is VerifyCodeFailed) {
            _loadingOverlay.hide();
            setState(() {
              errorMessage = 'Введен неверный код';
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                //TODO: добавить почту пользователя
                child: Text(
                  messageText,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        controller: pinController,
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        validator: (value) {
                          if (value?.length == 4) {
                            return null;
                          } else if (errorMessage.isNotEmpty) {
                            return errorMessage;
                          }
                          return 'Введите код';
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {},
                        onChanged: (value) {},
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: CustomButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 16, color: AppColors.white),
                    boxDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 36,
                    buttonText: buttonText,
                    color: AppColors.primaryColor,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Feedback.forTap(context);
                        _loadingOverlay.show(context);
                        context.read<VerifyCodeBloc>().add(
                            EnterCode(code: pinController.text, id: widget.id));
                      }
                    }),
              ),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              const Text(
                'Если код не пришел, проверьте, корректно ли указан адрес электронной почты',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
