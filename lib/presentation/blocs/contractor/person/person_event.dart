part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
  @override
  List<Object> get props => [];
}

class PersonInitialEvent extends PersonEvent{
  final String codCliente;
  final int codEmpresa;
  const PersonInitialEvent(this.codCliente, this.codEmpresa);
}
