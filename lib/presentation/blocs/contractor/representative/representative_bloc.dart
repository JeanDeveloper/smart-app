import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/representative.dart';
import 'package:smart/domain/usecases/request/get_list_representative.dart';

part 'representative_event.dart';
part 'representative_state.dart';

class RepresentativeBloc extends Bloc<RepresentativeEvent, RepresentativeState> {
  
  GetListRepresentative getListRepresentative;
  
  RepresentativeBloc(this.getListRepresentative) : super(RepresentativeInitial()) {
    on<RepresentativeEvent>((event, emit) async {
      if( event is RepresentativeInitialEvent ){
        emit(RepresentativeLoading());
        final failureOrEntrys = await getListRepresentative( event.codSede ); 
        emit(_failureOrEntrys(failureOrEntrys));
      }

    });
  }


  RepresentativeState  _failureOrEntrys(Either<Failure, List<Representative>> failureOrentrys){
    return failureOrentrys.fold(
      (failure) => RepresentativeError(_mapFailureToMessage(failure)), 
      (entrys) => RepresentativeLoaded(entrys)
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
