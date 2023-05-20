part of 'credential_bloc.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();
  
  @override
  List<Object> get props => [];
}

class CredentialInitial extends CredentialState {}

class CredentialLoading extends CredentialState {}

class CredentialLoaded extends CredentialState {
  final List<Credential> credentials;
  CredentialLoaded(this.credentials);
}

class CredentialError extends CredentialState {
  final String message;
  CredentialError(this.message);
}
