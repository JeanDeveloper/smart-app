part of 'authority_bloc.dart';

abstract class AuthorityEvent extends Equatable {
  const AuthorityEvent();
  @override
  List<Object> get props => [];
}

class LoadPersonsAuthority extends AuthorityEvent{
  final int headCode;
  const LoadPersonsAuthority(this.headCode);
}

class RegisterPersonsEvent extends AuthorityEvent{
  final  List<PersonRequestAutority> selectedPersons;
  final bool isComplete;
  final int codCabecera;
  final String created;
  const RegisterPersonsEvent(this.selectedPersons, this.isComplete, this.codCabecera, this.created);
}