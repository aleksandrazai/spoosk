import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/user_id_notifier.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/bloc_verify_code/verify_code_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';

@RoutePage()
class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
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
              )),
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
                if (formKey.currentState!.validate()) {
                  Feedback.forTap(context);
                  context.read<VerifyCodeBloc>().add(EnterCode(
                      code: pinController.text,
                      id: Provider.of<UserDataProvider>(context, listen: false)
                          .userId));
                  context.read<UserProfileBloc>().add(GetUserInfo(
                      userId:
                          Provider.of<UserDataProvider>(context, listen: false)
                              .userId));
                  context.router.push(UserProfileRoute());
                }
              }),
        ],
      ),
    );
  }
}
