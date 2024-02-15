// ignore_for_file: must_be_immutable

part of 'resort_by_id_bloc.dart';

class ResortByIdState {
  ResortById? resortById;
  ResortByIdState({ResortById? resortById});
}

class ResortByIdInitial extends ResortByIdState {}

class ResortByIdLoaded extends ResortByIdState {
  @override
  ResortById? resortById;
  ResortByIdLoaded({required this.resortById});
}
