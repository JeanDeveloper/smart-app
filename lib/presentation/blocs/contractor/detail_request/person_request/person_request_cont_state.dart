part of 'person_request_cont_bloc.dart';

abstract class PersonRequestContState extends Equatable {
  const PersonRequestContState();
  @override
  List<Object> get props => [];
}

class PersonRequestContInitial extends PersonRequestContState {}


class PersonRequestContLoaded extends PersonRequestContState {
  final List<PersonRequestContractor> personsRequest;
  const PersonRequestContLoaded(this.personsRequest);
}

class PersonRequestContLoading extends PersonRequestContState {}

class PersonRequestContError extends PersonRequestContState {
  final String message;
  const PersonRequestContError(this.message);
}
