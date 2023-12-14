import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';
import 'package:spoosk/core/presentation/widgets/custom_login_field.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              onTapped: () {},
            ),
            title: Text('Вход в аккаунт',
                style: Theme.of(context).textTheme.headlineMedium)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //добавить варианты текста для разных экранов
              const Text('Зарегистрируйся и войди'),
              const Text('Адрес эл. почты'),
              LoginField(),
              const Text('Пароль'),
              LoginField(),
              TextButton(
                  onPressed: () {
                    context.router.push(ChangePasswordRoute());
                  },
                  child: const Text('Забыли пароль?')),
              CustomButton(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.white, fontSize: 16),
                  boxDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 36,
                  buttonText: 'Войти',
                  color: AppColors.primaryColor,
                  onTap: () {
                    context.router.push(UserProfileRoute());
                  }),
              SizedBox(height: 16),
              CustomButton(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 16, color: AppColors.primaryColor),
                  height: 36,
                  buttonText: 'Зарегистрироваться',
                  color: AppColors.gray,
                  onTap: () {
                    context.router.push(const RegisterRoute());
                  }),
            ],
          ),
        ));
  }
}
