import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/gender.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/entities/document_type.dart';
import 'package:smart/domain/response/create_person_response.dart';
import 'package:smart/domain/usecases/person/register_person.dart';

part 'create_person_event.dart';
part 'create_person_state.dart';

class CreatePersonBloc extends Bloc<CreatePersonEvent, CreatePersonState> {

  DocumentType? typeDocument;
  String? document;
  String? name1;
  String? name2;
  String? surname1;
  String? surname2;
  Gender? gender;
  final CreateNewPerson crearnuevaPersona;

  CreatePersonBloc(this.crearnuevaPersona) : super(CreatePersonInitial()) {
    on<CreatePersonEvent>((event, emit) async  {
      if( event is AddPersonEvent ){
        emit( CreatePersonLoading() );
        final failureOrReponse = await crearnuevaPersona(event.request);
        emit(_failureOrResponse(failureOrReponse));
      }
    });
  }

  CreatePersonState _failureOrResponse(Either<Failure, CreatePersonResponse> failureOrReponse){
    return failureOrReponse.fold(
      (failure) => CreatePersonError(_mapFailureToMessage(failure)), 
      (personResponse) {
        return CreatePersonLoaded(personResponse);
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
