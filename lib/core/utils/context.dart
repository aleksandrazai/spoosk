import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';

extension UserInfo on BuildContext {
  UserProfileBloc get userInfo => UserProfileBloc.bloc(this);
}
