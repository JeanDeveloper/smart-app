import 'dart:convert';

import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/global/api.dart';
import 'package:smart/data/models/login_response_model.dart';
import 'package:smart/domain/request/login_request.dart';
import 'package:smart/domain/response/login_response.dart';
import 'package:http/http.dart' as http;


abstract class IAuthDataSource{
  Future<LoginResponse> login(LoginRequest request);
}

class AuthDataSource extends IAuthDataSource{

  final http.Client client;
  AuthDataSource(this.client);

  @override
  Future<LoginResponseModel> login(LoginRequest request) async {

    final Uri uri  = Uri.http(Api.apiUrl, 'api/auth/login/');
    final response = await  client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String>{
          "username": request.username,
          "password": request.password,
        }
      ),
    );

    if( response.statusCode == 200  ){
      final decoded = loginResponseModelFromJson(response.body);

      if( decoded.status == -1 ){ 
        throw AuthException(decoded.message);
      }else{
        return decoded;
      }
      
    } 
    else {
      throw ServerException();
    }
  }
}

