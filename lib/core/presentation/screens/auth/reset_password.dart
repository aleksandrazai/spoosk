import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../colors.dart';
import '../../../data/models/user_id_notifier.dart';
import '../../bloc_password_reset/reset_bloc.dart';
import '../../routes.gr.dart';
import '../../theme/theme.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/custom_leading.dart';
import '../../widgets/custom_login_field.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
      body: BlocListener<ResetBloc, ResetState>(
        listener: (context, state) {
          if (state is ResetSuccessfull) {
            final userId = state.id;
            Provider.of<UserDataProvider>(context, listen: false)
                .setUserId(userId);
            context.router.navigate(EnterCodeRoute(sourcePage: 'Reset'));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48.0),
                child: Text(
                  'Введите адрес электронной почты, указанный при регистрации, и мы отправим на него код для восстановления пароля.',
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                'Адрес эл. почты',
                textAlign: TextAlign.left,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: LoginField(
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
                  buttonText: 'Отправить код',
                  color: AppColors.primaryColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Feedback.forTap(context);
                      context
                          .read<ResetBloc>()
                          .add(ResetRequested(email: _emailController.text));
                    }
                    context.router
                        .navigate(EnterCodeRoute(sourcePage: 'Сброс'));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String value) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+(\.[a-zA-Z0-9._%+-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,7})+$');
    return emailRegex.hasMatch(value);
  }
}
