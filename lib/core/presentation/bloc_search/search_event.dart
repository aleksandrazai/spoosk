part of 'search_bloc.dart';

class SearchResortEvent {}

class SearchTextInput extends SearchResortEvent {
  final String searchText;

  SearchTextInput({required this.searchText});
}
