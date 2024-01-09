import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/user_id_notifier.dart';
import 'package:spoosk/core/presentation/bloc_login/login_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';
import 'package:spoosk/core/presentation/widgets/custom_login_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_clearErrorMessage);
  }

  void _clearErrorMessage() {
    if (errorMessage.isNotEmpty) {
      setState(() {
        errorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessfull) {
          final userId = state.id;
          Provider.of<UserDataProvider>(context, listen: false)
              .setUserId(userId);
          context.read<UserProfileBloc>().add(GetUserInfo(userId: userId));
          context.router.push(UserProfileRoute());
        }
        if (state is LoginFailed) {
          print('Login Error state received');
          setState(() {
            errorMessage = 'Ошибка. Вы ввели неверные данные авторизации';
          });
        }
      },
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.background,
              titleTextStyle: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w700,
              ),
              // leading: CustomLeadingIcon(
              //   onTapped: () {},
              // ),
              title: Text('Вход в аккаунт',
                  style: Theme.of(context).textTheme.headlineMedium)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: добавить варианты текста для разных экранов
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        'Используй все возможности Spoosk.\nЗарегистрируйся и добавляй свои любимые курорты в избранное, а также оставляй отзывы и делись впечатлениями о курортах с другими пользователями',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Text('Адрес эл. почты'),
                    LoginField(
                        hintText: 'Почта',
                        controller: _emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Укажите адрес эл. почты';
                          } else if (!_isValidEmail(value)) {
                            return 'Некорректный формат';
                          } else if (errorMessage.isNotEmpty) {
                            return errorMessage;
                          }
                          return null;
                        }),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text('Пароль'),
                    ),
                    LoginField(
                        hintText: 'Пароль',
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите пароль';
                          } else if (value.length < 8) {
                            return 'Пароль должен содержать не менее 8 символов';
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9!#.$%&+=?^_`{|}~-]{8,128}$')
                              .hasMatch(value)) {
                            return 'Пароль содержит запрещенные символы';
                          }
                          return null;
                        }),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          style: ButtonStyle(
                              iconColor: MaterialStatePropertyAll(
                                  AppColors.primaryColor)),
                          onPressed: () {
                            context.router.navigate(const ResetPasswordRoute());
                          },
                          child: Text('Забыли пароль?',
                              style: TextStyle(color: AppColors.primaryColor))),
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.white, fontSize: 16),
                        boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 36,
                        buttonText: 'Войти',
                        color: AppColors.primaryColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Feedback.forTap(context);
                            context.read<LoginBloc>().add(FilledFormEvent(
                                email: _emailController.text,
                                password: _passwordController.text));
                          }
                        }),
                    const SizedBox(height: 16),
                    CustomButton(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontSize: 16, color: AppColors.primaryColor),
                        height: 36,
                        buttonText: 'Зарегистрироваться',
                        color: AppColors.gray,
                        onTap: () {
                          context.router.push(const RegisterRoute());
                        }),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  bool _isValidEmail(String value) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+(\.[a-zA-Z0-9._%+-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,7})+$');
    return emailRegex.hasMatch(value);
  }
}
