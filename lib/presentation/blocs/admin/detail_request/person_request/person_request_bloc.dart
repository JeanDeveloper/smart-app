import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_request.dart';
import 'package:smart/domain/usecases/request/get_list_person_request.dart';

part 'person_request_event.dart';
part 'person_request_state.dart';

class PersonRequestBloc extends Bloc<PersonRequestEvent, PersonRequestState> {

  final GetListPersonRequest getListPersonRequest ;
  late List<PersonRequest> personsRequest;

  PersonRequestBloc(this.getListPersonRequest) : super(PersonRequestInitial()) {
    on<PersonRequestEvent>((event, emit) async {

      if( event is PersonRequestInitialEvent ){
        emit(PersonRequestLoading());
        final persons = await getListPersonRequest( event.codCabecera, event.userName );
        emit(_failureOrPersons(persons));
      }

    });
  }

  PersonRequestState _failureOrPersons(Either<Failure, List<PersonRequest>> personsRequests){
    return personsRequests.fold(
      (failure) => PersonRequestError(_mapFailureToMessage(failure)), 
      (persons) {
        personsRequest = persons;
        return PersonRequestLoaded(personsRequest);
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
