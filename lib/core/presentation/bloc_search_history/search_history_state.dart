part of 'search_history_bloc.dart';

@immutable
sealed class SearchHistoryState {}

final class SearchHistoryInitial extends SearchHistoryState {
  final List<Result> resortsFound;
  SearchHistoryInitial({required this.resortsFound});
}

class SearchHistoryDB extends SearchHistoryState {
  final List<Result> data;
  SearchHistoryDB({required this.data});
}
