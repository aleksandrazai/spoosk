import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../colors.dart';
import '../../../data/models/user_id_notifier.dart';
import '../../bloc_register/register_bloc.dart';
import '../../routes.gr.dart';
import '../../theme/theme.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/custom_leading.dart';
import '../../widgets/custom_login_field.dart';
import '../../widgets/loading_overlay.dart';

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
  String errorMessage = '';
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

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
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessfull) {
          // _loadingOverlay.hide();
          final userId = state.id;
          Provider.of<UserDataProvider>(context, listen: false)
              .setUserId(userId);
          context.router.push(EnterCodeRoute(sourcePage: 'Регистрация'));
        }
        if (state is RegisterFailed) {
          // _loadingOverlay.hide();
          errorMessage = 'Пользователь с таким email уже существует';
        }
        // if (state is RegisterLoading) {
        //   _loadingOverlay.show(context);
        // }
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text('Имя'),
                ),
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
                const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text('Адрес эл. почты'),
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                      'Пароль должен быть без пробела и содержать не менее 8 символов',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
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
                        ?.copyWith(fontSize: 16, color: AppColors.primaryColor),
                    height: 36,
                    buttonText: 'Войти',
                    color: AppColors.gray,
                    onTap: () {
                      context.router.push(const LoginRoute());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(value);
  }
}
