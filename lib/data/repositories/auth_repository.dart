import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart/data/datasources/auth_datasource.dart';
import 'package:smart/domain/repositories/iauth_repository.dart';
import 'package:smart/domain/request/login_request.dart';
import 'package:smart/domain/response/login_response.dart';

class AuthRepository extends IAuthRepository{

  final IAuthDataSource authDataSource;
  AuthRepository(this.authDataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest login) async {
    try {
      final loginResponse = await authDataSource.login(login);
      return Right(loginResponse);
    }on AuthException catch(auth){
      return Left(AuthFailure(message: auth.message ));
    } on ServerException {
      return Left(ServerFailure(message: "Ha ocurrido un problema en el servidor"));
    } 
  }
  
  // @override
  // Future<bool> logout() async {

  //   final token =   await localStorageRepository.getToken();
  //   // await authDataSource.logout(token);

  //   final clean = await localStorageRepository.clearAllData();
  //   return  true;


  // }

}