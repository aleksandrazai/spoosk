part of 'search_bloc.dart';

class SearchResortState {
  List<Resort> resortsFound = [];
}

class SearchResortInitial extends SearchResortState {
  @override
  List<Resort> resortsFound = [];
}

class SearchResortLoaded extends SearchResortState {
  @override
  final List<Resort> resortsFound;

  SearchResortLoaded({required this.resortsFound});
}

class SearchResortNotFound extends SearchResortState {}
