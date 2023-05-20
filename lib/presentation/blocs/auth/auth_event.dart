part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];

}

class DoLoginEvent extends AuthEvent{
  final String username;
  final String password;
  DoLoginEvent(this.username, this.password);
}

class DoLogoutEvent extends AuthEvent{}

class GetUserStorageEvent extends AuthEvent{}

class StartValidation extends AuthEvent{}