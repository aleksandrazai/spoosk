// ignore_for_file: must_be_immutable

part of 'resort_by_id_bloc.dart';

class ResortByIdState {
  ResortById? resortById;
  ResortByIdState({ResortById? resortById});
}

class ResortByIdInitial extends ResortByIdState {}

class StateGetResortById extends ResortByIdState {
  @override
  ResortById? resortById;
  StateGetResortById({required this.resortById});
}
