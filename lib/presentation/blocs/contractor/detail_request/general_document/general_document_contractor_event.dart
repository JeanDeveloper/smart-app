part of 'general_document_contractor_bloc.dart';

abstract class GeneralDocumentContractorEvent extends Equatable {
  const GeneralDocumentContractorEvent();

  @override
  List<Object> get props => [];
}

class GeneralDocumentInitialContractor extends GeneralDocumentContractorEvent{
  final int codCabecera;
  const GeneralDocumentInitialContractor(this.codCabecera);
}