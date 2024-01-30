part of 'request_controller_bloc.dart';

abstract class PorularResortState {
  final List<ResortCard> resortsAll;
  PorularResortState({required this.resortsAll});
}

class PorularResortInitial extends PorularResortState {
  PorularResortInitial({required super.resortsAll});
}

class PorularResortLoaded extends PorularResortState {
  PorularResortLoaded({required super.resortsAll});
}

class PorularResortUpdate extends PorularResortState {
  PorularResortUpdate({required super.resortsAll});
}
