import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes.gr.dart';

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
              context.router.push(const LoginRoute());
            },
            child: const Text('Вход')),
        ElevatedButton(
            onPressed: () {
              context.router.push(UserProfileRoute());
            },
            child: const Text('Профиль')),
      ]),
    );
  }
}
