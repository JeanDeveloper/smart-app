import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/credential.dart';
import 'package:smart/domain/usecases/credential/enabled_credential.dart';
import 'package:smart/domain/usecases/credential/get_credentials.dart';

part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {


  final GetCredentials getCredentials;
  final EnabledCredential enabledCredential;

  List<Credential> credentials = [];

  CredentialBloc(this.getCredentials, this.enabledCredential) : super(CredentialInitial()) {
    on<CredentialEvent>((event, emit) async {

      if( event is CredentialInitialEvent ){
        emit(CredentialLoading());
        final failureOrCredentials = await getCredentials( event.codCliente, event.codEmpresa ); 
        emit(_failureOrCredentials(failureOrCredentials));
      }

      if( event is EnabledCredentialEvent ){
        emit(CredentialLoading());
        final failureOrSucess = await enabledCredential( event.accionCode , event.code, event.userName, event.created ); 
        final failureOrCredentials = await getCredentials( event.codCliente, event.codEmpresa ); 
        emit(_failureOrCredentials(failureOrCredentials));

      }

    });
  }

  CredentialState _failureOrCredentials(Either<Failure, List<Credential>> failureOrcontractors){
    return failureOrcontractors.fold(
      (failure) => CredentialError(_mapFailureToMessage(failure)), 
      (credentialsResp) {
        credentials = credentialsResp;
        return CredentialLoaded(credentialsResp);
      }
    );
  }

  String _mapFailureToMessage( Failure failure ){
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      case AuthFailure:
        return failure.message;
      default:
        return "Error inesperado";
    }
  }
}
