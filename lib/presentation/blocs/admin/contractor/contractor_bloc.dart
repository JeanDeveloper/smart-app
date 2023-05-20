import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/response/contractor_response.dart';
import 'package:smart/domain/usecases/contractor/get_contractors.dart';

part 'contractor_event.dart';
part 'contractor_state.dart';

class ContractorBloc extends Bloc<ContractorEvent, ContractorState> {
  final GetContractors getContractors;

  List<ContractorResponse> contractors = [];

  ContractorBloc(this.getContractors) : super(ContractorInitial()) {
    on<ContractorEvent>((event, emit) async {

      if( event is ContractorInitialEvent ){
        emit(ContractorLoading());
        final failureOrContractors = await getContractors( event.customerCode ); 
        emit(_failureOrContractors(failureOrContractors));
      }

    });
  }

  ContractorState _failureOrContractors(Either<Failure, List<ContractorResponse>> failureOrcontractors){
    return failureOrcontractors.fold(
      (failure) => ContractorError(_mapFailureToMessage(failure)), 
      (contractorsResp) {
        contractors = contractorsResp;
        return ContractorLoaded(contractorsResp);
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
