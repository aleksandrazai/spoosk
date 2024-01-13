import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc_user_by_id/user_bloc.dart';
import '../../image.dart';
import '../../routes.gr.dart';
import '../../widgets/resort_screen_widgets/line_button_w_icons.dart';

@RoutePage()
class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late final UserProfileBloc userProfileBloc;

  @override
  void initState() {
    super.initState();
    userProfileBloc = context.read<UserProfileBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<UserProfileBloc>().state;
        if (state is UserProfileLoaded) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 104,
                      width: 104,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(84),
                        ),
                      ),
                      child: Image.asset(image_avatar_placeholder,
                          fit: BoxFit.cover),
                    ),
                    Text(state.userProfile.firstName,
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text(state.userProfile.email,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: LineButtonWithIcons(
                          onTap: () {},
                          imageName: image_edit,
                          text: 'Редактировать профиль'),
                    ),
                    LineButtonWithIcons(
                        onTap: () {},
                        imageName: image_reviews,
                        text: 'Мои отзывы'),
                    TextButton(
                      child: const Text('Выйти'),
                      onPressed: () {
                        userProfileBloc.add(UserLogOut());
                        context.router.push(const LoginRoute());
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: ElevatedButton(
              onPressed: () {
                context.router.push(const LoginRoute());
              },
              child: const Text(
                  'Пользователь не авторизирован, Вернуться к странице авторизации')),
        );
      },
    );
  }
}
