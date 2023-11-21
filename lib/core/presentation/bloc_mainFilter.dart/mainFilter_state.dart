part of 'mainFilter_bloc.dart';

class MainFilterState {}

class MainFilterInitial extends MainFilterState {}

class MainFilterLoaded extends MainFilterState {
  MainFilterLoaded({required this.resortsMainFilter});
  final List<Resorts> resortsMainFilter;
}
