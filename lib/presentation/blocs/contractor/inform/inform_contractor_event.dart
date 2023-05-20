part of 'inform_contractor_bloc.dart';

abstract class InformContractorEvent extends Equatable {
  const InformContractorEvent();
  @override
  List<Object> get props => [];
}

class SendInformContractor extends InformContractorEvent{
  final String codeEncrypt;
  final String createdBy;
  // final BuildContext context;
  const SendInformContractor(
    this.codeEncrypt, 
    this.createdBy, 
    // this.context
  );
}