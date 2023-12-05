part of 'search_bloc.dart';

class SearchResortState {
  List<Result> resortsFound = [];
}

class SearchResortInitial extends SearchResortState {
  List<Result> resortsFound = [];
}

class SearchResortLoaded extends SearchResortState {
  final List<Result> resortsFound;

  SearchResortLoaded({required this.resortsFound});
}

class SearchResortNotFound extends SearchResortState {}
