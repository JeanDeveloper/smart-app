part of 'general_person_doc_bloc.dart';

abstract class GeneralPersonDocEvent extends Equatable {
  const GeneralPersonDocEvent();
  @override
  List<Object> get props => [];
}

class ShowListPersonEvent extends GeneralPersonDocEvent{
  final int code;
  const ShowListPersonEvent(this.code);
}

class AddPersonDocGenEvent extends GeneralPersonDocEvent{
  final List<GeneralPersonDoc> items;
  final List<GeneralPersonDoc> selectedPersons;
  final List<GeneralPersonDoc> initialPersons;
  final int codCabecera;
  final int codDocument;
  const AddPersonDocGenEvent(this.items,this.initialPersons,this.selectedPersons, this.codCabecera, this.codDocument);
} 