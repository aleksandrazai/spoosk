import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/screens/auth/login.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    //TODO: убрать временную заглушку
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              context.router.push(LoginRoute());
            },
            child: Text('Экран авторизации')),
        ElevatedButton(
            onPressed: () {
              context.router.push(UserProfileRoute());
            },
            child: Text('Профиль'))
      ]),
    );
  }
}
