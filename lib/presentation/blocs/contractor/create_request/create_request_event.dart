part of 'create_request_bloc.dart';

abstract class CreateRequestEvent extends Equatable {
  const CreateRequestEvent();
  @override
  List<Object> get props => [];
}

class AddRequestEvent extends CreateRequestEvent{
  final CreateRequestRequest request;
  const AddRequestEvent(this.request);
}