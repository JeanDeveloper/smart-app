import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/entry_type.dart';
import 'package:smart/domain/usecases/request/get_list_entry_type.dart';

part 'entry_type_event.dart';
part 'entry_type_state.dart';

class EntryTypeBloc extends Bloc<EntryTypeEvent, EntryTypeState> {

  GetListEntryType getListEntryType;

  EntryTypeBloc(this.getListEntryType) : super(EntryTypeInitial()) {

    on<EntryTypeEvent>((event, emit) async {

      if( event is EntryTypeInitialEvent ){
        emit(EntryTypeLoading());
        final failureOrEntrys = await getListEntryType( event.customerCode ); 
        emit(_failureOrEntrys(failureOrEntrys));
      }

    });

  }

  EntryTypeState  _failureOrEntrys(Either<Failure, List<EntryType>> failureOrentrys){
    return failureOrentrys.fold(
      (failure) => EntryTypeError(_mapFailureToMessage(failure)), 
      (entrys) => EntryTypeLoaded(entrys)
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
