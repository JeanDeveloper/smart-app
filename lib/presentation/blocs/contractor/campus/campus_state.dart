part of 'campus_bloc.dart';

abstract class CampusState extends Equatable {
  const CampusState();
  @override
  List<Object> get props => [];
}

class CampusInitial extends CampusState {}

class CampusLoading extends CampusState {}

class CampusLoaded extends CampusState {
  final List<Campus> campus;
  const CampusLoaded(this.campus);
}

class CampusError extends CampusState {
  final String message;
  const CampusError(this.message);
}