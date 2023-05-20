import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/general_document.dart';
import 'package:smart/domain/usecases/request/get_list_general_document.dart';
import 'package:smart/domain/usecases/status/add_status.dart';

part 'general_document_event.dart';
part 'general_document_state.dart';

class GeneralDocumentBloc extends Bloc<GeneralDocumentEvent, GeneralDocumentState> {

  final GetListGeneralDocument getListGeneralRequest;
  final AddState addState;
  late List<GeneralDocument> generalDocuments;
  
  
  GeneralDocumentBloc(this.getListGeneralRequest, this.addState) : super(GeneralDocumentInitial()) {

    on<GeneralDocumentEvent>((event, emit) async {
      

      if( event is GeneralDocumentInitialEvent){
        emit(GeneralDocumentLoading());
        final generalDocumentss = await getListGeneralRequest(event.codCabecera, event.userName);
        emit(_failureOrDocument(generalDocumentss));
      }

      if( event is AddStatusEvent){
        emit(GeneralDocumentLoading());
        await addState(event.codigo, event.codState, null, event.creadoPor);
        final generalDocumentss = await getListGeneralRequest(event.codSolDoc.toString(), event.userName);
        emit(_failureOrDocument(generalDocumentss));
      }

    });
  }


  GeneralDocumentState _failureOrDocument(Either<Failure, List<GeneralDocument>> generalDocumentss){
    return generalDocumentss.fold(
      (failure) => GeneralDocumentError(_mapFailureToMessage(failure)), 
      (documents) {
        generalDocuments = documents;
        return GeneralDocumentLoaded(documents);
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
