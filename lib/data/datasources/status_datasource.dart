import 'dart:convert';

import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/domain/request/observation_request.dart';
import 'package:http/http.dart' as http;

abstract class IStatusDataSource{
  Future<int> registerStatus(RegisterStatusRequest request);
}


class StatusDataSource extends IStatusDataSource{

  final http.Client client;
  StatusDataSource(this.client);

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
      // final decodedData = json.decode(utf8.decode(response.bodyBytes)) ;
      return 1;
    } 
    else {
      throw ServerException();
    }
  }



}