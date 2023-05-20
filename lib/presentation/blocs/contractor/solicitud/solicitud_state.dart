part of 'solicitud_bloc.dart';

abstract class SolicitudState extends Equatable {
  const SolicitudState();
  
  @override
  List<Object> get props => [];
}

class SolicitudInitial extends SolicitudState {}


class SolicitudLoading extends SolicitudState{}


class SolicitudLoaded extends SolicitudState{
  final List<ContractorRequest> requests;
  const SolicitudLoaded(this.requests);
}


class SolicitudError extends SolicitudState{
  final String message;
  const SolicitudError(this.message);
}

