import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/screens/auth/login.dart';
import 'package:spoosk/core/presentation/widgets/resort_screen_widgets/line_button_w_icons.dart';
import 'package:spoosk/core/presentation/widgets/user_avatar.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            context.router.push(const UserEditProfile());
                          },
                          imageName: image_edit,
                          text: 'Редактировать профиль'),
                    ),
                    LineButtonWithIcons(
                        onTap: () {
                          context.router.push(const UserReviews());
                        },
                        imageName: image_reviews,
                        text: 'Мои отзывы'),
                    TextButton(
                      child: const Text('Выйти'),
                      onPressed: () {
                        context.read<UserProfileBloc>().add(UserLogOut());
                        context.router.push(const LoginRoute());
                      },
                    )
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
