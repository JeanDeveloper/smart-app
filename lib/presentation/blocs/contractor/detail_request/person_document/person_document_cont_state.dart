part of 'person_document_cont_bloc.dart';

abstract class PersonDocumentContState extends Equatable {
  const PersonDocumentContState();
  
  @override
  List<Object> get props => [];
}


class PersonDocumentContInitial extends PersonDocumentContState {}

class PersonDocumentContLoading extends PersonDocumentContState {}

class PersonDocumentContLoaded extends PersonDocumentContState {
  final List<PersonDocumentRequestContractor> documents;
  // final CourseState? stateCourse;
  const PersonDocumentContLoaded(this.documents);
}

class PersonDocumentContError extends PersonDocumentContState {
  final String message;
  const PersonDocumentContError(this.message);
}
