part of 'create_person_bloc.dart';

abstract class CreatePersonEvent extends Equatable {
  const CreatePersonEvent();
  @override
  List<Object> get props => [];
}

class AddPersonEvent extends CreatePersonEvent{
  final CreatePersonRequest request;
  const AddPersonEvent(this.request);
}