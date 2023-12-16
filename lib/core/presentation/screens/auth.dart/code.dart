import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';

@RoutePage()
class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({super.key});

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
          title: Text('Введите код',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: Column(
        children: [
          Text('Код'),
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
                context.router.push(UserProfileRoute());
              }),
        ],
      ),
    );
  }
}
