import 'dart:convert';

import 'package:smart/data/models/user_model.dart';
import 'package:smart/domain/entities/user.dart';
import 'package:smart/domain/response/login_response.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel extends LoginResponse{

  LoginResponseModel({
    required this.status,
    required this.token,
    required this.message,
    required this.user,
  }) : super( 
    status: status, 
    token: token, 
    message: message, 
    user:user 
  );

  @override
  int status;

  @override
  String token;

  @override
  String message;

  @override
  User user;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    status: json["status"],
    token: json["token"],
    message: json["message"],
    user: UserModel.fromJson(json["user"]),
  );


}


