import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/sucursal.dart';
import 'package:smart/domain/usecases/request/get_list_sucursal.dart';

part 'sucursal_event.dart';
part 'sucursal_state.dart';

class SucursalBloc extends Bloc<SucursalEvent, SucursalState> {

  GetListSucursal getListSucursal;

  SucursalBloc( this.getListSucursal ) : super(SucursalInitial()) {
    on<SucursalEvent>((event, emit) async {

      if( event is SucursalInitialEvent ){
        emit(SucursalLoading());
        final failureOrSucursal = await getListSucursal( event.customerCode, event.conText ); 
        emit(_failureOrSucursal(failureOrSucursal));
      }

    });
  }

  SucursalState  _failureOrSucursal(Either<Failure, List<Sucursal>> failureOrSucursal){
    return failureOrSucursal.fold(
      (failure)    => SucursalError(_mapFailureToMessage(failure)), 
      (sucursales) => SucursalLoaded(sucursales)
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
