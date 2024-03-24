import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/features/home/bloc/popular_resorts/request_controller_bloc.dart';
import 'package:spoosk/core/presentation/features/resort/widgets/resort_screen_widgets/line_button_w_icons.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/router/routes.gr.dart';
import 'package:spoosk/core/presentation/features/auth/login/view/login.dart';
import 'package:spoosk/core/presentation/features/user/profile/view/user_avatar.dart';
import 'package:spoosk/core/presentation/widgets/custom_dialog.dart';
import 'package:spoosk/core/utils/context.dart';

@RoutePage()
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileEdited) {
          context.read<UserProfileBloc>().add(
                GetUserInfo(
                  userId: context.userInfo.getUserInfo()!.userProfile.id,
                ),
              );
        }
        if (state is UserProfileLoaded) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    const UserAvatar(),
                    Text(state.userProfile.firstName,
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text(state.userProfile.email ?? '',
                        style: Theme.of(context).textTheme.bodyMedium),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: LineButtonWithIcons(
                          onTap: () {
                            context.router.navigate(const UserEditProfile());
                          },
                          imageName: image_edit,
                          text: 'Редактировать профиль'),
                    ),
                    LineButtonWithIcons(
                        onTap: () {
                          context.router.navigate(const UserReviews());
                        },
                        imageName: image_reviews,
                        text: 'Мои отзывы'),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          child: Text('Выйти',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: AppColors.primaryColor)),
                          onPressed: () {
                            CustomDialog.showCustomDialog(
                                context: context,
                                title: 'Выйти из профиля?',
                                bodyText:
                                    'Вы уверены, что хотите выйти из профиля?',
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        CustomDialog.closeCustomDialog(context);
                                        context.read<UserProfileBloc>().add(
                                            UserLogOut(
                                                userId: state.userProfile.id));
                                        context
                                            .read<PorularResortBloc>()
                                            .add(LoadAllPorularResorts());
                                        context.router
                                            .navigate(const LoginRoute());
                                      },
                                      child: const Text('Выйти')),
                                  TextButton(
                                      onPressed: () {
                                        CustomDialog.closeCustomDialog(context);
                                      },
                                      child: const Text('Закрыть')),
                                ]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const LoginScreen();
      },
    );
  }
}
