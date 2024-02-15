part of 'region_bloc.dart';

abstract class RegionState {}

class RegionInitial extends RegionState {}

class RegionLoaded extends RegionState {
  RegionLoaded({required this.regionsAll});
  final List<Regions> regionsAll;
}
