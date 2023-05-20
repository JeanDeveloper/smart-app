import 'dart:convert';

import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/data/models/campus_model.dart';
import 'package:smart/data/models/comment_model.dart';
import 'package:smart/data/models/contractor_request_model.dart';
import 'package:smart/data/models/detail_request_general_model.dart';
import 'package:smart/data/models/entry_type_model.dart';
import 'package:smart/data/models/general_document_contractor_model.dart';
import 'package:smart/data/models/observation_model.dart';
import 'package:smart/data/models/person_document_request_contractor_model.dart';
import 'package:smart/data/models/person_document_request_model.dart';
import 'package:smart/data/models/person_request_autority_model.dart';
import 'package:smart/data/models/person_request_contractor_model.dart';
import 'package:smart/data/models/person_request_model.dart';
import 'package:smart/data/models/representative_model.dart';
import 'package:smart/data/models/solicitud_model.dart';
import 'package:smart/data/models/state_course_model.dart';
import 'package:smart/data/models/sucursal_model.dart';
import 'package:smart/domain/entities/campus.dart';
import 'package:smart/domain/entities/comment.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/domain/entities/entry_type.dart';
import 'package:smart/domain/entities/general_document.dart';
import 'package:smart/domain/entities/observation.dart';
import 'package:smart/domain/entities/person_document_request.dart';
import 'package:smart/domain/entities/general_document_contractor.dart';
import 'package:smart/domain/entities/person_document_request_contractor.dart';
import 'package:smart/domain/entities/person_request.dart';
import 'package:smart/domain/entities/person_request_autority.dart';
import 'package:smart/domain/entities/person_request_contractor.dart';
import 'package:smart/domain/entities/representative.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/entities/state_course.dart';
import 'package:smart/domain/entities/sucursal.dart';
import 'package:smart/domain/request/observation_request.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/request/register_status_request.dart';
import 'package:smart/domain/request/request_request.dart';
import 'package:smart/domain/response/request_response.dart';
import 'package:http/http.dart' as http;

abstract class IRequestDataSource{
  Future<List<Solicitud>> getRequests(RequestListRequest request);
  Future<List<GeneralDocument>> getGeneralDocuments(GeneralDetailRequestListRequest request);
  Future<List<PersonRequest>> getPersonsRequest(GeneralDetailRequestListRequest request);
  Future<List<PersonDocumentRequest>> getDocumentsPersonRequest(PersonDocumentRequestListRequest request);
  Future<List<Observation>> getObservations(int code);
  Future<List<Comment>> getComments(int code);
  Future<CourseState?> getInductionCourseState(CourseStateRequest request);
  Future<int> registerStatus(RegisterStatusRequest request);
  Future<List<PersonRequestAutority>> getPersonsAutority(int headCode);
  Future<List<ContractorRequest>> getContractorRequests(int enterpriseCode, String customerCode);
  Future<List<EntryType>> getListEntryType(String customerCode);
  Future<List<Sucursal>> getListSucursal(String customerCode, String conText);
  Future<List<Campus>> getListSede(int codSede);
  Future<List<Representative>> getListRepresentative(int codSede);
  Future<CreateRequestResponse> createRequest( CreateRequestRequest request );
  Future<int> updateCodeEncrypt( int codCabecera, String codeEncrypt );
  Future<int> registerRequestStatus( RegisterStatusRequestRequest request );

  //CONTRATISTA
  Future<List<GeneralDocumentContractor>> getGeneralDocumentsContractor( int codCabecera);
  Future<List<PersonRequestContractor>>   getPersonsRequestContractor(int codCabecera);
  Future<List<PersonDocumentRequestContractor>> getDocumentsPersonRequestContractor( int codDetPersona);

}

class RequestDataSource extends IRequestDataSource{

  final http.Client client;
  RequestDataSource(this.client);

  @override
  Future<List<Solicitud>> getRequests(RequestListRequest request)  async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/',
      {
        "codCliente": request.codCliente,
        "userCode": "${request.userCode}",
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return solicitudModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }
  }

  @override
  Future<List<GeneralDocument>> getGeneralDocuments(GeneralDetailRequestListRequest request) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/detail/general/',
      {
        "codCabecera": request.codCabecera,
        "userName":    request.userName,
      }
    );

    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return detailRequestGeneralModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<PersonRequest>> getPersonsRequest(GeneralDetailRequestListRequest request) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/detail/person/',
      {
        "codCabecera": request.codCabecera,
        "userName":    request.userName,
      }
    );

    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return personRequestModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<PersonDocumentRequest>> getDocumentsPersonRequest(PersonDocumentRequestListRequest request)async  {

    final Uri uri  = Uri.http(  
      Api.apiUrl, 
      'api/request/detail/person/document/',
      {
        "codDetPersona": request.codDetPersona.toString(),
        "userName":    request.userName,
      }
    );

    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200 ){
      return personDocumentRequestModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }


  }

  @override
  Future<List<Observation>> getObservations(int code) async {

  final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/detail/person/document/observation/',
      {
        "code": code.toString()
      }
    );

    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200 ){
      return observationModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<CourseState?> getInductionCourseState(CourseStateRequest request) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/person/course/',
      {
        "ruc":  request.ruc ,
        "nroDoc":  request.nroDoc ,
        "enterprise":  request.enterPrise ,
        "codeEncrypt":  request.codeEncrypt ,
      }
    );

    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200 ){
      if( response.body == "[]" ) return null;
      final decodedData = json.decode(response.body);
      return CourseStateModel.fromJson(decodedData[0]);
    } 
    else{
      throw ServerException();
    }

  }
  
  @override
  Future<List<Comment>> getComments(int code) async{
    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/detail/person/document/comment/',
      {
        "code": code.toString()
      }
    );

    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200 ){
      return CommentModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }
  
  @override
  Future<int> registerStatus(RegisterStatusRequest request) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/status/',
    );

    final response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, dynamic>{
          'codSolDoc':  request.codSolDoc,
          'codEstado':  request.codEstado,
          'obs':        request.obs,
          'creadoPor':  request.creadoPor
        }
      )
    );

    if( response.statusCode == 200 ){
      return 1;
    } 
    else {
      throw ServerException();
    }
  }

  @override
  Future<List<PersonRequestAutority>> getPersonsAutority(int headCode) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/autorithy/person/',
      {
        "codCabecera": headCode.toString()
      }
    );

    final response = await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200 ){
      return personRequestAutorityModelFromJson(response.body);

    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<ContractorRequest>> getContractorRequests(int enterpriseCode, String customerCode) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/contractor',
      {
        "enterPriseCode": "${enterpriseCode}",
        "customerCode": customerCode,
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return contractorRequestModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<EntryType>> getListEntryType(String customerCode) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/entrytype',
      {
        "codcliente": customerCode,
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return entryTypeModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<Sucursal>> getListSucursal(String customerCode, String conText) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/sucursal',
      {
        "codcliente": customerCode,
        "ambito": conText,
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return sucursalModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<Campus>> getListSede(int codSede) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/campus',
      {
        "codSede": codSede.toString() 
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return campusModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<Representative>> getListRepresentative(int codSede) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/representative',
      {
        "codSede": codSede.toString() 
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return representativeModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<CreateRequestResponse> createRequest(CreateRequestRequest request) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/',
    );

    final response = await client.post(

      uri,

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },

      body: jsonEncode(
        <String, dynamic>{
          'codTipoIngreso': request.codTipoIngreso,
          'codCliente':     request.codCliente,
          'codEmpresa':     request.codEmpresa,
          'codSede':        request.codSede,
          'codSubSede':     request.codSubSede,
          'codAmbito':      request.codAmbito,
          'codAutorizante': request.codAutorizante,
          'fechaInicio':    request.fechaInicio.toString(),
          'fechaFin':       request.fechaFin.toString(),
          'creadoPor':      request.creadoPor,
          'habilitado':     request.habilitado,
        }
      )

    );

    if( response.statusCode == 200 ){
      return createRequestResponseFromJson(response.body); 
    } 
    else {
      throw ServerException();
    }
  }

  @override
  Future<int> updateCodeEncrypt(int codCabecera, String codeEncrypt) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/codeEncrypt',
    );

    final response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },

      body: jsonEncode(
        <String, dynamic>{
          'codCabecera':codCabecera,
          'codeEncrypt':codeEncrypt,
        }
      )

    );

    if( response.statusCode == 200 ){
      return 1;
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<int> registerRequestStatus(RegisterStatusRequestRequest request) async {

    final Uri uri = Uri.http( Api.apiUrl, 'api/request/status' );

    final response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },

      body: jsonEncode(
        <String, dynamic>{
          'codCabecera':request.codCabecera,
          'codEstado':request.codEstado,
          'creadoPor':request.creadoPor,
        }
      )
    );

    if( response.statusCode == 200 ){
      return 1;
    } 
    else {
      throw ServerException();
    }
  }

  @override
  Future<List<GeneralDocumentContractor>> getGeneralDocumentsContractor(int codCabecera) async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/detail/general/contractor',
      {
        "codCabecera": codCabecera.toString() 
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return generalDocumentContractorModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

  @override
  Future<List<PersonRequestContractor>> getPersonsRequestContractor(int codCabecera)  async {

    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/detail/person/contractor',
      {
        "codCabecera": codCabecera.toString() 
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return personRequestContractorModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }



  }
  
  @override
  Future<List<PersonDocumentRequestContractor>> getDocumentsPersonRequestContractor(int codDetPersona) async {
    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/request/detail/person/document/contractor',
      {
        "codDetPersona": codDetPersona.toString() 
      }
    );

    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if( response.statusCode == 200  ){
      return personDocumentRequestContractorModelFromJson(response.body);
    } 
    else {
      throw ServerException();
    }

  }

}