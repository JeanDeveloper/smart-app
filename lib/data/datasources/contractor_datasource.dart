import 'package:http/http.dart' as http;
import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/data/models/contractor_response_model.dart';
import 'package:smart/domain/response/contractor_response.dart';

abstract class IContractorDataSource{

  Future<List<ContractorResponse>> getContractorByCustomer(String customerCode);

}

class ContractorDataSource extends IContractorDataSource{

  final http.Client client;
  ContractorDataSource(this.client);
  
  @override
  Future<List<ContractorResponse>> getContractorByCustomer(String customerCode) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/contractor/',
      {
        "customerCode": customerCode,
      }
    );

    final resp =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( resp.statusCode == 200  ){
      return contractorResponseModelFromJson(resp.body);
    } 
    else {
      throw ServerException();
    }
  }

}


