part of 'request_controller_bloc.dart';

abstract class PorularResortState {}

class PorularResortInitial extends PorularResortState {}

class PorularResortLoaded extends PorularResortState {
  PorularResortLoaded({required this.resortsAll});
  final List<Resort> resortsAll;
}
