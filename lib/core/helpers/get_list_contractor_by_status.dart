


import 'package:smart/domain/response/contractor_response.dart';

class ContractorUtil{

  static List<ContractorResponse> getContractorsByStatus( List<ContractorResponse>? contractors, bool status  ){
    if(contractors != null){
      return contractors.where((x) => x.estado == status).toList();
    }else{
      return [];
    }
  }


}