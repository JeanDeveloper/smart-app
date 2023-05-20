import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_document_request_contractor.dart';
import 'package:smart/domain/usecases/perfil-contractor/get_list_person_document.dart';

part 'person_document_cont_event.dart';
part 'person_document_cont_state.dart';

class PersonDocumentContBloc extends Bloc<PersonDocumentContEvent, PersonDocumentContState> {

  final GetListPersonDocumentC getListPersonDocument;


  PersonDocumentContBloc(this.getListPersonDocument) : super(PersonDocumentContInitial()) {
    on<PersonDocumentContEvent>((event, emit) async {

      if(event is InitialEvent){
        emit(PersonDocumentContLoading());
        final documentsPerson = await getListPersonDocument(event.codDetPerson);
        emit(await _failureOrDocument(documentsPerson));
      }
    });
  }



  Future<PersonDocumentContState> _failureOrDocument(Either<Failure, List<PersonDocumentRequestContractor>> documentPerson) async {
    return documentPerson.fold(
      (failure) => PersonDocumentContError(_mapFailureToMessage(failure)), 
      (documents) async {
        // final stateCourse = await getInductionCourseState(event.ruc, event.nroDoc, event.enterPrise, event.codeEncrypt);
        return PersonDocumentContLoaded(documents);
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
