import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_document_request.dart';
import 'package:smart/domain/entities/state_course.dart';
import 'package:smart/domain/request/person_document_initial.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/usecases/person/get_induction_course_state.dart';
import 'package:smart/domain/usecases/request/get_list_person_document.dart';
import 'package:smart/domain/usecases/status/add_status.dart';

part 'person_document_request_event.dart';
part 'person_document_request_state.dart';

class PersonDocumentRequestBloc extends Bloc<PersonDocumentRequestEvent, PersonDocumentRequestState> {
  
  final GetListPersonDocument getListPersonDocument;
  final GetInductionCourseState getInductionCourseState;
  final AddState addState;

  PersonDocumentRequestBloc( this.getListPersonDocument, this.getInductionCourseState, this.addState ) : super(PersonDocumentRequestInitial()) {

    on<PersonDocumentRequestEvent>((event, emit) async {
      if(event is InitialEvent){
        emit(PersonDocumentRequestLoading());
        final documentsPerson = await getListPersonDocument(event.codDetPerson, event.userName);
        emit(await _failureOrDocument(documentsPerson, event.courseStateRequest));
      }
      if(event is AddStatus){
        emit(PersonDocumentRequestLoading());
        await addState(event.codSolDoc, event.codState, null, event.creadoPor);
        final documentsPerson = await getListPersonDocument(  event.personDocumentRequest.codDetPerson, event.personDocumentRequest.username );
        emit(await _failureOrDocument(documentsPerson, event.personDocumentRequest.courseState));
      }

    });

  }

  Future<PersonDocumentRequestState> _failureOrDocument(Either<Failure, List<PersonDocumentRequest>> documentPerson, CourseStateRequest  event) async {
    return documentPerson.fold(
      (failure) => PersonDocumentRequestError(_mapFailureToMessage(failure)), 
      (documents) async {
        final stateCourse = await getInductionCourseState(event.ruc, event.nroDoc, event.enterPrise, event.codeEncrypt);
        return PersonDocumentRequestLoaded(documents, stateCourse);
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
