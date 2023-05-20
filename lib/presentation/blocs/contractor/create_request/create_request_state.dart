part of 'create_request_bloc.dart';

abstract class CreateRequestState extends Equatable {
  const CreateRequestState();
  @override
  List<Object> get props => [];
}

class CreateRequestInitial extends CreateRequestState{}
class CreateRequestLoading extends CreateRequestState{}
// class CreateRequestPreLoaded  extends CreateRequestState{
//   final CreateRequestResponse  response;
//   const CreateRequestPreLoaded(this.response);
// }

class CreateRequestLoaded  extends CreateRequestState{
  final CreateRequestResponse  response;
  const CreateRequestLoaded(this.response);
}
class CreateRequestError   extends CreateRequestState{
  final String message;
  const CreateRequestError(this.message);
}
