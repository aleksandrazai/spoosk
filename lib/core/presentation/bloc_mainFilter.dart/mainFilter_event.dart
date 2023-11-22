// ignore_for_file: non_constant_identifier_names

part of 'mainFilter_bloc.dart';

class MainFilterEvent {}

class MainFilterRequest extends MainFilterEvent {
  MainFilterRequest(
      {required this.resort_region,
      required this.resort_month,
      required this.resort_level});

  final List<String> resort_region;
  final List<String> resort_month;
  final List<String> resort_level;
}
