import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/general_document_contractor.dart';
import 'package:smart/domain/usecases/perfil-contractor/get_list_general_documents.dart';

part 'general_document_contractor_event.dart';
part 'general_document_contractor_state.dart';

class GeneralDocumentContractorBloc extends Bloc<GeneralDocumentContractorEvent, GeneralDocumentContractorState> {

  final GetListGeneralDocumentC getListGeneralDocument;
  late List<GeneralDocumentContractor> generalDocuments;

  GeneralDocumentContractorBloc(this.getListGeneralDocument) : super(GeneralDocumentContractorInitial()) {
    on<GeneralDocumentContractorEvent>((event, emit) async {
      if( event is GeneralDocumentInitialContractor){
        emit(GeneralDocumentContractorLoading());
        final generalDocumentss = await getListGeneralDocument(event.codCabecera);
        emit(_failureOrDocument(generalDocumentss));
      }
    });
  }

  GeneralDocumentContractorState _failureOrDocument(Either<Failure, List<GeneralDocumentContractor>> generalDocumentss){
    return generalDocumentss.fold(
      (failure) => GeneralDocumentContractorError(_mapFailureToMessage(failure)), 
      (documents) {
        generalDocuments = documents;
        return GeneralDocumentContractorLoaded(documents);
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
