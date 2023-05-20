import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/domain/usecases/request/get_contractor_request.dart';

part 'solicitud_event.dart';
part 'solicitud_state.dart';

class SolicitudBloc extends Bloc<SolicitudEvent, SolicitudState> {

  final GetContractorRequests getRequest;

  List<ContractorRequest> requests = [];

  SolicitudBloc(this.getRequest) : super(SolicitudInitial()) {
    on<SolicitudEvent>((event, emit) async {

      if(event is InitialEvent){
        emit(SolicitudLoading());
        final failureOrRequests = await getRequest( event.enterPriseCode, event.customerCode ); 
        emit(_failureOrRequests(failureOrRequests));
      }

    });
  }

  SolicitudState _failureOrRequests(Either<Failure, List<ContractorRequest>> failureOrRequest){
    return failureOrRequest.fold(
      (failure) => SolicitudError(_mapFailureToMessage(failure)), 
      (requestss) {
        requests = requestss;
        return SolicitudLoaded(requestss);
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
