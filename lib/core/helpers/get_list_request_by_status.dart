import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/domain/entities/solicitud.dart';

class RequestUtils{

  static List<Solicitud> getRequestsByStatus( List<Solicitud>? requests, String status ){
    if( requests != null){
      return requests.where((x) => x.status == status).toList();
    }else{
      return [];
    }
  }

  static List<ContractorRequest> getRequestsContractorByStatus( List<ContractorRequest>? requests, String status ){
    if( requests != null){
      return requests.where((x) => x.nombre == status).toList();
    }else{
      return [];
    }
  }

}