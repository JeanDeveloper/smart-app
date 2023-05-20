part of 'person_document_cont_bloc.dart';

abstract class PersonDocumentContEvent extends Equatable {
  const PersonDocumentContEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends PersonDocumentContEvent{
  final int codDetPerson;
  // final CourseStateRequest courseStateRequest;

  const InitialEvent( 
    this.codDetPerson, 
    // this.courseStateRequest,
  );
}

