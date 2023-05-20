part of 'contractor_bloc.dart';

abstract class ContractorState extends Equatable {
  const ContractorState();
  @override
  List<Object> get props => [];
}

class ContractorInitial extends ContractorState {}
class ContractorError extends ContractorState {
  final String message;
  ContractorError(this.message);
}
class ContractorLoading extends ContractorState {}
class ContractorLoaded extends ContractorState {

  final List<ContractorResponse> contractors;
  ContractorLoaded(this.contractors);
}
