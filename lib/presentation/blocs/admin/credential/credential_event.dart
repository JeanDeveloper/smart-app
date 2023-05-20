part of 'credential_bloc.dart';

abstract class CredentialEvent extends Equatable {
  final String codCliente;
  final int codEmpresa;
  const CredentialEvent(this.codCliente, this.codEmpresa);
  @override
  List<Object> get props => [codCliente, codEmpresa];
}

class CredentialInitialEvent extends CredentialEvent {
  const CredentialInitialEvent(super.codCliente, super.codEmpresa);
}

class EnabledCredentialEvent extends CredentialEvent {
  final int accionCode;
  final int code;
  final String userName;
  final String created;
  const EnabledCredentialEvent(this.accionCode, super.codCliente, super.codEmpresa, this.code, this.userName, this.created);
}