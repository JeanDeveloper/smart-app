part of 'create_person_bloc.dart';

abstract class CreatePersonState extends Equatable {
  const CreatePersonState();
  
  @override
  List<Object> get props => [];
}

class CreatePersonInitial extends CreatePersonState {}

class CreatePersonLoading extends CreatePersonState{}

class CreatePersonLoaded extends CreatePersonState{
  final CreatePersonResponse response;
  CreatePersonLoaded(this.response);
}

class CreatePersonError extends CreatePersonState{
  final String message;
  CreatePersonError(this.message);
}
