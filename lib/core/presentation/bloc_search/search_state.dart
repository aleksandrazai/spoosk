part of 'search_bloc.dart';

class SearchResortState {}

class SearchResortInitial extends SearchResortState {}

class SearchResortLoaded extends SearchResortState {
  final List<Result> resortsFound;

  SearchResortLoaded({required this.resortsFound});
}
