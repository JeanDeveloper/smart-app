part of 'person_request_bloc.dart';

abstract class PersonRequestState extends Equatable {
  const PersonRequestState();
  
  @override
  List<Object> get props => [];
}

class PersonRequestInitial extends PersonRequestState {}

class PersonRequestLoaded extends PersonRequestState {
  final List<PersonRequest> personsRequest;
  PersonRequestLoaded(this.personsRequest);
}

class PersonRequestLoading extends PersonRequestState {}

class PersonRequestError extends PersonRequestState {
  final String message;
  PersonRequestError(this.message);
}
