import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/user_id_notifier.dart';
import 'package:spoosk/core/presentation/bloc_register/register_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';
import 'package:spoosk/core/presentation/widgets/custom_login_field.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessfull) {
          final userId = state.id;
          Provider.of<UserDataProvider>(context, listen: false)
              .setUserId(userId);
          context.router.push(const EnterCodeRoute());
        }
        if (state is RegisterFailed) {
          print('RegisterState: Failed');
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
              leading: CustomLeadingIcon(
                onTapped: () {
                  AutoRouter.of(context).navigate(const LoginRoute());
                },
              ),
              title: Text('Регистрация',
                  style: Theme.of(context).textTheme.headlineMedium)),
          body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              children: [
                LoginField(
                    hintText: 'Имя',
                    controller: _nameController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Укажите имя';
                      } else if (value.length > 20) {
                        return 'Имя слишком длинное';
                      }
                      return null;
                    }),
                LoginField(
                    hintText: 'Почта',
                    controller: _emailController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Укажите адрес эл. почты';
                      } else if (!_isValidEmail(value)) {
                        return 'Некорректный формат';
                      }
                      return null;
                    }),
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
                CustomButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 16, color: AppColors.white),
                    boxDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 36,
                    buttonText: 'Зарегистрироваться',
                    color: AppColors.primaryColor,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Feedback.forTap(context);
                        context.read<RegisterBloc>().add(RegisterFormFilled(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _nameController.text));
                      }
                    }),
                const SizedBox(height: 16),
                CustomButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 16),
                    height: 36,
                    buttonText: 'Войти',
                    color: AppColors.gray,
                    onTap: () {}),
              ],
            ),
          )),
    );
  }

  bool _isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(value);
  }
}
