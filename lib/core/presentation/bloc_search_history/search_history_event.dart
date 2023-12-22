part of 'search_history_bloc.dart';

@immutable
sealed class SearchHistoryEvent {}

class SearchResortHistory extends SearchHistoryEvent {
  late final List<Result> history;
  SearchResortHistory({required this.history});
}
