import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:spoosk/core/data/models/user_profile.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';

import '../../../auth/login/view/login.dart';
import 'package:spoosk/core/presentation/features/user/profile/view/user_profile.dart';

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
          return const UserProfileScreen();
        }
        if (state is UserProfileFailed) {
          return const LoginScreen();
        }

        if (state is UserProfileLoad) {
          return const Center(child: CircularProgressIndicator());
        }
        return const LoginScreen();
      },
    );
  }
}
