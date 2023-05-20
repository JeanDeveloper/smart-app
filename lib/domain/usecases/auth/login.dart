import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/iauth_repository.dart';
import 'package:smart/domain/request/login_request.dart';
import 'package:smart/domain/response/login_response.dart';

class HasLogin{

  final IAuthRepository iAuthRepository;
  HasLogin(this.iAuthRepository);

  Future<Either<Failure, LoginResponse>> call(String username, String password) async {
    final loginRequest = LoginRequest(username, password);
    return iAuthRepository.login(loginRequest);
  }

}