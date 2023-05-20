part of 'person_document_request_bloc.dart';

abstract class PersonDocumentRequestState extends Equatable {
  const PersonDocumentRequestState();
  @override
  List<Object> get props => [];
}

class PersonDocumentRequestInitial extends PersonDocumentRequestState {}
class PersonDocumentRequestLoading extends PersonDocumentRequestState {}

class PersonDocumentRequestLoaded extends PersonDocumentRequestState {
  final List<PersonDocumentRequest> documents;
  final CourseState? stateCourse;
  const PersonDocumentRequestLoaded(this.documents, this.stateCourse);
}

class PersonDocumentRequestError extends PersonDocumentRequestState {
  final String message;
  const PersonDocumentRequestError(this.message);
}
