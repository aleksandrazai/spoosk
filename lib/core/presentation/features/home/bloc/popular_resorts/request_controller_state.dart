part of 'request_controller_bloc.dart';

sealed class PorularResortState extends Equatable {
  @override
  List<Object> get props => [];
}

class PorularResortInitial extends PorularResortState {
  @override
  List<Object> get props => [];
}

class PorularResortLoaded extends PorularResortState {
  PorularResortLoaded({required this.resortsAll});
  final List<Resort> resortsAll;

  @override
  List<Object> get props => super.props..add(resortsAll);
}
