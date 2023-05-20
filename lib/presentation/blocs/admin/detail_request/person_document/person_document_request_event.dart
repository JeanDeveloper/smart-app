part of 'person_document_request_bloc.dart';

abstract class PersonDocumentRequestEvent extends Equatable {
  const PersonDocumentRequestEvent();
  @override
  List<Object> get props => [];
}

class InitialEvent extends PersonDocumentRequestEvent{
  final int codDetPerson;
  final String userName;
  final CourseStateRequest courseStateRequest;

  const InitialEvent( 
    this.codDetPerson, 
    this.userName, 
    this.courseStateRequest,
  );
}

class ShowObservationsEvent extends PersonDocumentRequestEvent{
  final int code;
  const ShowObservationsEvent(this.code);
}

class AddStatus extends PersonDocumentRequestEvent{
  PersonDocumentInitialRequest personDocumentRequest;
  final int codSolDoc;
  final int codState;
  final String creadoPor;
  AddStatus(this.codSolDoc, this.codState, this.creadoPor, this.personDocumentRequest);
}
