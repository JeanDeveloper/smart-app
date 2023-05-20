part of 'person_request_bloc.dart';

abstract class PersonRequestEvent extends Equatable {
  const PersonRequestEvent();

  @override
  List<Object> get props => [];
}

class PersonRequestInitialEvent extends PersonRequestEvent{
  final String codCabecera;
  final String userName;

  PersonRequestInitialEvent(this.codCabecera, this.userName);

}

