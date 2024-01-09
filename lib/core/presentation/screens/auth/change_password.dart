import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/user_id_notifier.dart';
import 'package:spoosk/core/presentation/bloc_password_new.dart%20/new_password_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';
import 'package:spoosk/core/presentation/widgets/custom_login_field.dart';

@RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          title: Text('Восстановление пароля',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: BlocListener<NewPasswordBloc, NewPasswordState>(
        listener: (context, state) {
          if (state is NewPasswordSuccessfull) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: ((BuildContext context) {
                return AlertDialog(
                  title: const Text('Пароль успешно изменен'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          context.router.push(const LoginRoute());
                          context.router.pop();
                        },
                        child: const Text('Закрыть'))
                  ],
                );
              }),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48.0),
                //TODO: добавить почту пользователя
                child: Text(
                  'Введите новый пароль',
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                'Пароль',
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: LoginField(
                    hintText: 'Пароль',
                    controller: _passwordController,
                    obscureText: false,
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                    'Пароль должен быть без пробела и содержать не менее 8 символов',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              const SizedBox(height: 20),
              CustomButton(
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.white, fontSize: 16),
                boxDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 36,
                buttonText: 'Установить пароль',
                color: AppColors.primaryColor,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Feedback.forTap(context);
                    context.read<NewPasswordBloc>().add(PasswordEntered(
                        password: _passwordController.text,
                        id: Provider.of<UserDataProvider>(context,
                                listen: false)
                            .userId));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
