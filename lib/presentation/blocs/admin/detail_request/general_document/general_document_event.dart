part of 'general_document_bloc.dart';

abstract class GeneralDocumentEvent extends Equatable {
  const GeneralDocumentEvent();

  @override
  List<Object> get props => [];
}

class GeneralDocumentInitialEvent extends GeneralDocumentEvent{
  final String codCabecera;
  final String userName;
  GeneralDocumentInitialEvent(this.codCabecera, this.userName);
}

class AddStatusEvent extends GeneralDocumentEvent{
  final int codigo;
  final String userName;
  final int codSolDoc;
  final int codState;
  final String creadoPor;
  AddStatusEvent(this.codigo, this.userName, this.codSolDoc, this.codState, this.creadoPor);
}



