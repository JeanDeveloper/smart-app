import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/request/login_request.dart';
import 'package:smart/domain/response/login_response.dart';

abstract class IAuthRepository{

  Future<Either<Failure, LoginResponse>> login( LoginRequest login );

  // Future<bool> logout();  

}