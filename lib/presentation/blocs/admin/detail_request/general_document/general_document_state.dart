part of 'general_document_bloc.dart';

abstract class GeneralDocumentState extends Equatable {
  const GeneralDocumentState();
  
  @override
  List<Object> get props => [];
}

class GeneralDocumentInitial extends GeneralDocumentState {}

class GeneralDocumentLoading extends GeneralDocumentState {}

class GeneralDocumentLoaded extends GeneralDocumentState {
  final List<GeneralDocument> generaldocuments;
  const GeneralDocumentLoaded(this.generaldocuments);
}

class GeneralDocumentError extends GeneralDocumentState {
  final String message;
  const GeneralDocumentError(this.message);
}




