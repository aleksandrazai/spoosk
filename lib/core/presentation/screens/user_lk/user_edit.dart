import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/theme/theme.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/custom_leading.dart';
import 'package:spoosk/core/presentation/widgets/custom_login_field.dart';
import 'package:spoosk/core/presentation/widgets/user_avatar.dart';
import 'package:spoosk/core/utils/context.dart';

@RoutePage()
class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firstNameController.text =
        context.userInfo.getUserInfo()?.userProfile.firstName ?? '';
    _lastNameController.text =
        context.userInfo.getUserInfo()?.userProfile.lastName ?? '';
    _nickNameController.text =
        context.userInfo.getUserInfo()?.userProfile.nickname ?? '';
    _countryController.text =
        context.userInfo.getUserInfo()?.userProfile.country ?? '';
    _cityController.text =
        context.userInfo.getUserInfo()?.userProfile.city ?? '';
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
              context.router.back();
            },
          ),
          title: Text('Редактирование профиля',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: BlocListener<UserProfileBloc, UserProfileState>(
        listener: (context, state) {
          if (state is UserProfileEdited) {
            context.read<UserProfileBloc>().add(
                  GetUserInfo(
                    userId: state.userProfile.id,
                  ),
                );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: UserAvatar()),
                const Text('Имя'),
                LoginField(
                  hintText: 'Имя',
                  controller: _firstNameController,
                  obscureText: false,
                  validator: (value) {
                    return null;
                  },
                ),
                const Text('Фамилия'),
                LoginField(
                  hintText: 'Фамилия',
                  controller: _lastNameController,
                  obscureText: false,
                  validator: (value) {
                    return null;
                  },
                ),
                const Text('Никнейм'),
                LoginField(
                  hintText: 'Никнейм',
                  controller: _nickNameController,
                  obscureText: false,
                  validator: (value) {
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Страна'),
                          LoginField(
                            hintText: 'Страна',
                            controller: _countryController,
                            obscureText: false,
                            validator: (value) {
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Город'),
                          LoginField(
                            hintText: 'Город',
                            controller: _cityController,
                            obscureText: false,
                            validator: (value) {
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: CustomButton(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: AppColors.white, fontSize: 16),
                      boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      height: 36,
                      buttonText: 'Сохранить',
                      color: AppColors.primaryColor,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Feedback.forTap(context);
                          context.read<UserProfileBloc>().add(EditUserProfile(
                              userId: context.userInfo
                                  .getUserInfo()!
                                  .userProfile
                                  .id,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              nickName: _nickNameController.text,
                              country: _countryController.text,
                              city: _cityController.text));
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
