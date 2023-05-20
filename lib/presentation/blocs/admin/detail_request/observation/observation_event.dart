part of 'observation_bloc.dart';

abstract class ObservationEvent extends Equatable {
  const ObservationEvent();
  @override
  List<Object> get props => [];
}

class ShowObservationsEvent extends ObservationEvent{
  final int code;
  const ShowObservationsEvent(this.code);
}

class AddObservationEvent extends ObservationEvent{
  final String message;
  final int codSolDoc;
  final int codState;
  final String creadoPor;
  final String codeEncrypt;
  final String nameDocument;
  const AddObservationEvent(
    this.message, 
    this.codSolDoc, 
    this.codState,
    this.creadoPor, 
    this.codeEncrypt,
    this.nameDocument
  );
}
