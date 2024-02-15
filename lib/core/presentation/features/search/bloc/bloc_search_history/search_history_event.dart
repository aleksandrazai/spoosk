part of 'search_history_bloc.dart';

@immutable
sealed class SearchHistoryEvent {}

class SearchResortHistory extends SearchHistoryEvent {
  late final List<Resort> history;
  SearchResortHistory({required this.history});
}
