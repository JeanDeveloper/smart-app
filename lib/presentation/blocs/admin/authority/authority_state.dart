part of 'authority_bloc.dart';

abstract class AuthorityState extends Equatable {
  const AuthorityState();
  
  @override
  List<Object> get props => [];
}

class AuthorityInitial extends AuthorityState {}

class  AuthorityLoading extends AuthorityState{}

class  AuthorityLoaded extends AuthorityState{
  final List<PersonRequestAutority> persons;
  const AuthorityLoaded(this.persons);
}

class  AuthorityError extends AuthorityState{
  final String message;
  const AuthorityError(this.message);
}


