part of 'observation_bloc.dart';

abstract class ObservationState extends Equatable {
  const ObservationState();
  @override
  List<Object> get props => [];
}

class ObservationInitial extends ObservationState {}
class ObservationLoading extends ObservationState {}

class ObservationLoaded extends ObservationState {
  final List<Observation> observations;
  const ObservationLoaded(this.observations);
}

class ObservationError extends ObservationState {
  final String message;
  const ObservationError(this.message);
}
