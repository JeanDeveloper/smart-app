import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_request_contractor.dart';
import 'package:smart/domain/usecases/perfil-contractor/git_list_person_request.dart';

part 'person_request_cont_event.dart';
part 'person_request_cont_state.dart';

class PersonRequestContBloc extends Bloc<PersonRequestContEvent, PersonRequestContState> {

  final GetListPersonRequestContractor getListPersonRequestContracotro ;
  late List<PersonRequestContractor> personsRequest;

  PersonRequestContBloc(this.getListPersonRequestContracotro) : super(PersonRequestContInitial()) {
    on<PersonRequestContEvent>((event, emit) async  {

      if( event is PersonRequestInitialEventCont ){
        emit(PersonRequestContLoading());
        final persons = await getListPersonRequestContracotro( event.codCabecera );
        emit(_failureOrPersons(persons));
      }

    });
  }

  PersonRequestContState _failureOrPersons(Either<Failure, List<PersonRequestContractor>> personsRequests){
    return personsRequests.fold(
      (failure) => PersonRequestContError(_mapFailureToMessage(failure)), 
      (persons) {
        personsRequest = persons;
        return PersonRequestContLoaded(personsRequest);
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