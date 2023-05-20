import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/campus.dart';
import 'package:smart/domain/usecases/request/get_list_campus.dart';

part 'campus_event.dart';
part 'campus_state.dart';

class CampusBloc extends Bloc<CampusEvent, CampusState> {

  GetListCampus getListCampus;

  CampusBloc(this.getListCampus) : super(CampusInitial()) {

    on<CampusEvent>((event, emit)  async {

      if( event is CampusInitialEvent ){
        emit(CampusLoading());
        final failureOrCampus = await getListCampus( event.codSede ); 
        emit(_failureOrCampus(failureOrCampus));
      }

    });

  }


  CampusState  _failureOrCampus(Either<Failure, List<Campus>> failureOrCampus){
    return failureOrCampus.fold(
      (failure) => CampusError(_mapFailureToMessage(failure)), 
      (entrys)  => CampusLoaded(entrys)
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
