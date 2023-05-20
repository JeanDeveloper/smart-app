part of 'request_bloc.dart';

abstract class RequestState extends Equatable {
  const RequestState();
  
  @override
  List<Object> get props => [];
}

class RequestInitial extends RequestState {}

class RequestLoading extends RequestState{}

class RequestLoaded extends RequestState{
  final List<Solicitud> requests;
  const RequestLoaded(this.requests);
}

class RequestError extends RequestState{
  final String message;
  const RequestError(this.message);
}

