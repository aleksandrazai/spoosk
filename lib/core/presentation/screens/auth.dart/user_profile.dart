import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';

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
          return Column(
            children: [
              Text('Имя ${state.userProfile.firstName}'),
              Text('Почта ${state.userProfile.email}'),
            ],
          );
        }
        return Text('Личный кабинет');
      },
    );
  }
}
