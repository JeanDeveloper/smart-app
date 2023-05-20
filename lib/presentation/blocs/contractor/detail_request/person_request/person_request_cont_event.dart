part of 'person_request_cont_bloc.dart';

abstract class PersonRequestContEvent extends Equatable {
  const PersonRequestContEvent();
  @override
  List<Object> get props => [];
}

class PersonRequestInitialEventCont extends PersonRequestContEvent{
  final int codCabecera;
  const PersonRequestInitialEventCont(this.codCabecera);
}
