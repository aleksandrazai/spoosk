import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/screens/auth/login.dart';
import 'package:spoosk/core/presentation/screens/auth/user_profile.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          return UserProfileScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
