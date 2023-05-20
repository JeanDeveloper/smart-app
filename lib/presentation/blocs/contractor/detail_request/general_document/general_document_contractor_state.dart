part of 'general_document_contractor_bloc.dart';

abstract class GeneralDocumentContractorState extends Equatable {
  const GeneralDocumentContractorState();
  
  @override
  List<Object> get props => [];
}

class GeneralDocumentContractorInitial extends GeneralDocumentContractorState {}

class GeneralDocumentContractorLoading extends GeneralDocumentContractorState {}

class GeneralDocumentContractorLoaded extends GeneralDocumentContractorState {
  final List<GeneralDocumentContractor> generaldocuments;
  const GeneralDocumentContractorLoaded(this.generaldocuments);
}

class GeneralDocumentContractorError extends GeneralDocumentContractorState {
  final String message;
  const GeneralDocumentContractorError(this.message);
}

