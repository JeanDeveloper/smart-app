import 'dart:convert';

import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/core/global/constants.dart';
import 'package:smart/domain/request/register_msg_wsp.dart';
import 'package:smart/domain/response/api_wassenger_response.dart';
import 'package:smart/domain/response/message_receiver_response.dart';
import 'package:http/http.dart' as http;


abstract class IMessageDataSource{
  Future<List<MsgReceiverResponse>> getInforeceiversMsg(String codeEncrypt);
  Future<ApiWassengerResponse> sendMsgWsp(String phone, String message);
  Future<int> registerMsgWsp( RegisterMsgWspRequest request );
}

class MessageDataSource extends IMessageDataSource{

  final http.Client client;
  MessageDataSource(this.client);

  @override
  Future<List<MsgReceiverResponse>> getInforeceiversMsg(String codeEncrypt) async {
    final Uri uri  = Uri.http( 
      Api.apiUrl, 
      'api/message/wsp',
      {
        "codeEncrypt": codeEncrypt,
      }
    );
    final response =  await client.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if( response.statusCode == 200 ){
      return msgReceiverResponseFromJson(response.body);
    } 
    else {
      throw ServerException();
    }
  }

  @override
  Future<ApiWassengerResponse> sendMsgWsp(String phone, String message) async {

    const String url = "api.wassenger.com"; 
    final Uri uri    = Uri.https(
      url, 
      '/v1/messages',
    );

    final resp = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Constants.wassengerKey}'
      },
      body: jsonEncode(
        <String, dynamic>{
          'phone':  "+51$phone",
          'message':  message,
        }
      )
    );

    if( resp.statusCode == 201 ){
      // final decodedData = json.decode(utf8.decode(resp.bodyBytes));
      return apiWassengerSucessResponseFromJson(resp.body);
    } if( resp.statusCode == 400 ){
      // final decodedData = json.decode(utf8.decode(resp.bodyBytes));
      return apiWassengerErrorResponseFromJson(resp.body);
    }
    else {
      throw ServerException();
    }
  }
  
  @override
  Future<int> registerMsgWsp(RegisterMsgWspRequest request) async {

    final Uri uri    = Uri.http(
      Api.apiUrl, 
      '/api/message/',
    );

    final resp = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          "codEnvio": request.codEnvio,
          "idApi":  request.idApi,
          "telefono": request.telefono,
          "codigoPers": request.codigoPers,
          "dni": request.dni,
          "nombre":  request.nombre,
          "mensaje": request.mensaje,
          "idArchivo": request.idArchivo,
          "error": request.error,
          "creado_por": request.creadoPor,
          "validaNum": request.validaNum
        }
      )
    );

    if( resp.statusCode == 200 ){
      return 1;
    } else {
      throw ServerException();
    }

  }

}

