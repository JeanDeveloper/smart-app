import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/observation.dart';
import 'package:smart/domain/usecases/request/register_observation.dart';
import 'package:smart/domain/usecases/request/get_list_observations.dart';

part 'observation_event.dart';
part 'observation_state.dart';

class ObservationBloc extends Bloc<ObservationEvent, ObservationState> {

  final GetListObservations getListObservations;
  final RegisterObservation registerObservation;

  ObservationBloc(this.getListObservations, this.registerObservation) : super(ObservationInitial()) {

    on<ObservationEvent>((event, emit) async {

      if( event is ShowObservationsEvent ){
        emit(ObservationLoading());
        final observations = await getListObservations(event.code);
        emit(_failureOrObservations(observations));
      }

      if( event is AddObservationEvent ){
        emit(ObservationLoading());
        final estado = await registerObservation(event.codeEncrypt, event.codSolDoc, event.codState, event.message, event.creadoPor, event.nameDocument);
        //Refresca el estado.
        final observations = await getListObservations(event.codSolDoc);
        emit( _failureOrObservations(observations));
      }

    });
  }

  ObservationState _failureOrObservations(Either<Failure, List<Observation>> failureOrObservation){
    return failureOrObservation.fold(
      (failure) => ObservationError(_mapFailureToMessage(failure)), 
      ( observations) {
        return ObservationLoaded(observations);
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
