import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/usecases/request/send_inform_contractor.dart';

part 'inform_contractor_event.dart';
part 'inform_contractor_state.dart';

class InformContractorBloc extends Bloc<InformContractorEvent, InformContractorState> {
  EnviarInformContractor enviarInformContractor;

  InformContractorBloc( this.enviarInformContractor ) : super(InformContractorInitial()) {
    on<InformContractorEvent>((event, emit)  async {
      if( event is SendInformContractor )  {

        emit(InformContractorLoading());
        final response = await enviarInformContractor(event.codeEncrypt, event.createdBy);
        emit(_failureOrInform(response));

      }
    });
  }

  InformContractorState  _failureOrInform(Either<Failure, int> failureOrInformContractor){
    return failureOrInformContractor.fold(
      (failure) => InformContractorError(_mapFailureToMessage(failure)), 
      (code)    => InformContractorLoaded(code)
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
