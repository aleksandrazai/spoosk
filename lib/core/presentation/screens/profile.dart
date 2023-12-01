import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile"),
    );
  }
}
