import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_request_autority.dart';
import 'package:smart/domain/usecases/authority/get_persons_authority.dart';
import 'package:smart/domain/usecases/authority/register_authorized_persons.dart';

part 'authority_event.dart';
part 'authority_state.dart';

class AuthorityBloc extends Bloc<AuthorityEvent, AuthorityState> {

  final GetAuthorityPersons getAuthorityRequests;
  final RegisterAuthorizedPersons registerAuthorizedPerson;

  AuthorityBloc(this.getAuthorityRequests, this.registerAuthorizedPerson) : super(AuthorityInitial()) {
    on<AuthorityEvent>((event, emit) async {

      if(event is LoadPersonsAuthority ){
        emit(AuthorityLoading());
        final failureOrRequests = await getAuthorityRequests(event.headCode ); 
        emit(_failureOrRequests(failureOrRequests));
      }

      if( event is RegisterPersonsEvent ){
        await registerAuthorizedPerson(event.selectedPersons, event.isComplete, event.codCabecera, event.created);
      }

    });
  }

  AuthorityState _failureOrRequests(Either<Failure, List<PersonRequestAutority>> failureOrPersons){
    return failureOrPersons.fold(
      (failure) => AuthorityError(_mapFailureToMessage(failure)), 
      (persons) {
        return AuthorityLoaded(persons);
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
