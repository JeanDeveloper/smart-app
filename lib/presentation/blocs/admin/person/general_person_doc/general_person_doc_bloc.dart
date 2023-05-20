import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/general_person_doc.dart';
import 'package:smart/domain/usecases/person/add_person_doc_gen.dart';
import 'package:smart/domain/usecases/person/get_general_person_doc.dart';

part 'general_person_doc_event.dart';
part 'general_person_doc_state.dart';

class GeneralPersonDocBloc extends Bloc<GeneralPersonDocEvent, GeneralPersonDocState> {

  final GetGeneralListPersonDoc getGeneralListPerson;
  final AddPersonDocGen addPersonDocGen;

  GeneralPersonDocBloc(this.getGeneralListPerson, this.addPersonDocGen) : super(GeneralPersonDocInitial()) {
    on<GeneralPersonDocEvent>((event, emit) async {

      if(event is ShowListPersonEvent){
        emit(GeneralPersonDocLoading());
        final listsPerson =  await getGeneralListPerson(event.code);
        emit( _failureOrGeneral(listsPerson) );
      }

      if(event is AddPersonDocGenEvent){
        // emit(GeneralPersonDocLoading());
        final listsPerson =  await addPersonDocGen(event.items, event.initialPersons, event.selectedPersons, event.codCabecera, event.codDocument);
        print(listsPerson);
        // emit(_failureOrGeneral(listsPerson));
      }

    });
  }

  GeneralPersonDocState _failureOrGeneral(Either<Failure, List<GeneralPersonDoc>> failureOrListsPerson){
    return failureOrListsPerson.fold(
      (failure) => GeneralPersonDocError(_mapFailureToMessage(failure)), 
      (personsList) {
        return GeneralPersonDocLoaded(personsList);
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
