import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/data/models/general_person_doc_.model.dart';
import 'package:smart/data/models/person_per_enterprise_model.dart';
import 'package:smart/domain/entities/general_person_doc.dart';
import 'package:http/http.dart' as http;
import 'package:smart/domain/entities/person_per_enterprise.dart';
import 'package:smart/domain/request/authorize_person_request.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/response/create_person_response.dart';

abstract class IPersonDataSource {
  Future<List<GeneralPersonDoc>> getPersonListofDoc( int codSolDoc );
  Future<List<PersonPerEnterprise>> getPersonListforEnterprise( String codCliente, int codEmpresa );
  Future<CreatePersonResponse> registerPerson( CreatePersonRequest request );
  Future<int> addPersonDocGen( String documento, int codCabecera, int codDocumento, int action );
  Future<int> authorizePerson( AuthorizePersonRequest request );

}

class PersonDataSource extends IPersonDataSource{

  final http.Client client;
  PersonDataSource(this.client);

  @override
  Future<List<GeneralPersonDoc>> getPersonListofDoc(int codSolDoc) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/person/general/',
      {
        "codSolDoc": codSolDoc.toString(),
      }
    );

    final resp =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( resp.statusCode == 200  ){
      return generalPersonDocModelFromJson(resp.body);
    } 
    else {
      throw ServerException();
    }
  }

  @override
  Future<List<PersonPerEnterprise>> getPersonListforEnterprise(String codCliente, int codEmpresa) async{

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/person/enterprise/',
      {
        "codCliente": codCliente,
        "codEmpresa": "$codEmpresa",
      }
    );

    final resp =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( resp.statusCode == 200  ){
      return personPerEnterpriseModelFromJson(resp.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<CreatePersonResponse> registerPerson(CreatePersonRequest request) async {

    final Uri uri  = Uri.http(Api.apiUrl, 'api/person');
    final response = await  client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String>{
          "codigo_personal": "${request.codPerson}",
          "codigo_cliente": request.codCustomer,
          "codigo_empresa": "${request.codEmpresa}",
          "codigo_tipo_documento": "${request.codDocType}",
          "habilitado": "${request.enabled}",
          "nombre1": request.name1,
          "nombre2": request.name2,
          "apellidos1": request.surname1,
          "apellidos2": request.surname2,
          "dni_personal": request.document,
          "sexo": request.gender,
          "creado_por": request.createdBy,
        }
      ),
    );

    if( response.statusCode == 200  ){
      final decoded = createPersonResponseFromJson(response.body);
      return decoded;

    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<int> addPersonDocGen(String documento, int codCabecera, int codDocumento, int action) async {
    final Uri uri  = Uri.http(Api.apiUrl, 'api/person/doc-gen/');
    final response = await  client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String>{
          "accion" : "$action",
          "documento": documento,
          "codCabecera": "$codCabecera",
          "codDocumento": "$codDocumento",
        }
      ),
    );
    if( response.statusCode == 200  ){
      return 1;
    } 
    else {
      throw ServerException();
    }
  }

  @override
  Future<int> authorizePerson(AuthorizePersonRequest request) async {
    final Uri uri  = Uri.http(Api.apiUrl, 'api/request/autorithy/person');
    final response = await  client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String>{
          "codCabecera" :  "${request.codCabecera}",
          "nroDoc":        request.nroDoc,
          "codDetPersona": "${request.codDetPersona}",
          "fechaInicio":   formatDate(request.fechaInicio, [yyyy, '-', mm, '-', dd]),
          "fechaFin":       formatDate(request.fechaFin, [yyyy, '-', mm, '-', dd]),
        }
      ),
    );
    if( response.statusCode == 200 ){
      return 1;
    } 
    else {
      throw ServerException();
    }
  }
}