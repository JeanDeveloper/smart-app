import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_per_enterprise.dart';
import 'package:smart/domain/usecases/person/get_persons_per_enterprise.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {


  final GetPersonsPerEnterPrise getPersonsPerEnterPrise;
  
  PersonBloc(this.getPersonsPerEnterPrise) : super(PersonInitial()) {
    on<PersonEvent>((event, emit) async {
      if(event is PersonInitialEvent){
        emit(PersonLoading());
        final failureOrRequests = await getPersonsPerEnterPrise( event.codCliente, event.codEmpresa ); 
        emit(_failureOrRequests(failureOrRequests));
      }
    });
  }

  PersonState _failureOrRequests(Either<Failure, List<PersonPerEnterprise>> failureOrRequest){
    return failureOrRequest.fold(
      (failure) => PersonError(_mapFailureToMessage(failure)), 
      (persons) {
        return PersonLoaded(persons);
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
