part of 'contractor_bloc.dart';

abstract class ContractorEvent extends Equatable {
  const ContractorEvent();
  @override
  List<Object> get props => [];
}

class ContractorInitialEvent extends ContractorEvent {
  final String customerCode;
  ContractorInitialEvent(this.customerCode);
}