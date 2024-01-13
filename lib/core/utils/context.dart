import 'package:flutter/material.dart';
import '../presentation/bloc_user_by_id/user_bloc.dart';

extension UserInfo on BuildContext {
  UserProfileBloc get userInfo => UserProfileBloc.bloc(this);
}
