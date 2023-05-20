import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/credential.dart';

abstract class ICredentialRepository{
  Future<Either<Failure, List<Credential>>>getLisCredentials( String codCliente, int codEmpresa );
  Future<Either<Failure, int>> enabledCredential( int actionCode, int code, String userName, String created );
}