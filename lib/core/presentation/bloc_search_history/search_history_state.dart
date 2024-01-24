part of 'search_history_bloc.dart';

@immutable
sealed class SearchHistoryState {}

final class SearchHistoryInitial extends SearchHistoryState {
  final List<Resort> resortsFound;
  SearchHistoryInitial({required this.resortsFound});
}

class SearchHistoryDB extends SearchHistoryState {
  final List<Resort> data;
  SearchHistoryDB({required this.data});
}
