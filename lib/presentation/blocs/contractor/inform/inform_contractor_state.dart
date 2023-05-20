part of 'inform_contractor_bloc.dart';

abstract class InformContractorState extends Equatable {
  const InformContractorState();
  @override
  List<Object> get props => [];
}

class InformContractorInitial extends InformContractorState {}
class InformContractorLoading extends InformContractorState {}
class InformContractorLoaded extends InformContractorState {
  final int response;
  const InformContractorLoaded(this.response);
}
class InformContractorError extends InformContractorState {
  final String message;
  const InformContractorError(this.message);
}