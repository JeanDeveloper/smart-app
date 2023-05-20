import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/usecases/request/get_request.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {

  final GetRequests getRequests;

  List<Solicitud> requests = [];

  RequestBloc(this.getRequests) : super(RequestInitial()) {
    on<RequestEvent>((event, emit) async {

      if(event is InitialEvent){
        emit(RequestLoading());
        final failureOrRequests = await getRequests( event.customerCode, event.userCode ); 
        emit(_failureOrRequests(failureOrRequests));
      }

      if( event is ShowRequestPersonal ){
        emit(RequestLoading());
      }
    });
  }

  RequestState _failureOrRequests(Either<Failure, List<Solicitud>> failureOrRequest){
    return failureOrRequest.fold(
      (failure) => RequestError(_mapFailureToMessage(failure)), 
      (requestss) {
        requests = requestss;
        return RequestLoaded(requestss);
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
