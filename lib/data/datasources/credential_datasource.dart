import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/data/models/credential_model.dart';
import 'package:smart/domain/entities/credential.dart';

abstract class ICredentialDataSource{
  Future<List<Credential>> getcredentialsByContractor(String codCliente, int codEmpresa );
  Future<int> enabledCredential(int actionCode, int code, String userName, String created);
}

class CredentialDataSource extends ICredentialDataSource{
  final http.Client client;
  CredentialDataSource(this.client);
  
  @override
  Future<List<Credential>> getcredentialsByContractor(String codCliente, int codEmpresa) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/credential/',
      {
        "codCliente": codCliente,
        "codEmpresa": codEmpresa.toString(),
      }
    );

    final resp =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( resp.statusCode == 200  ){
      return credentialModelFromJson(resp.body);
    } 
    else {
      throw ServerException();
    }
  }
  
  @override
  Future<int> enabledCredential(int actionCode, int code, String userName, String created) async {
    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/credential/hability/',
    );

    final response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, dynamic>{
          'actionCode': actionCode,
          'codigo':    code,
          'usuario':   userName,
          'creadoPor': created
        }
      )
    );

    if( response.statusCode == 200 ){
      // final decodedData = json.decode(utf8.decode(response.bodyBytes)) ;
      return 1;
    } 
    else {
      throw ServerException();
    }
  }


}