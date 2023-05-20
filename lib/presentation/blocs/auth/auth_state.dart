part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}

class AuthLoged extends AuthState{
  final User user;
  const AuthLoged(this.user);
}

class AuthError extends AuthState{
  final String message;
  const AuthError(this.message);
}

class AuthLogout extends AuthState{}

class AuthUnvalidated extends AuthState{}
