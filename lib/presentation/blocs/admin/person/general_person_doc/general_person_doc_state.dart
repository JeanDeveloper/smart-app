part of 'general_person_doc_bloc.dart';

abstract class GeneralPersonDocState extends Equatable {
  const GeneralPersonDocState();
  @override
  List<Object> get props => [];
}

class GeneralPersonDocInitial extends GeneralPersonDocState {}
class GeneralPersonDocLoading extends GeneralPersonDocState {}
class GeneralPersonDocLoaded extends GeneralPersonDocState {
  final List<GeneralPersonDoc> personsList;
  const GeneralPersonDocLoaded(this.personsList);
}
class GeneralPersonDocError extends GeneralPersonDocState {
  final String message;
  const GeneralPersonDocError(this.message);
}


