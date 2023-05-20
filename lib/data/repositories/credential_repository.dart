import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/domain/entities/credential.dart';
import 'package:smart/data/datasources/credential_datasource.dart';
import 'package:smart/domain/repositories/icredential_repository.dart';

class CredentialRepository extends ICredentialRepository {

  final ICredentialDataSource credentialDataSource;
  CredentialRepository(this.credentialDataSource);

  @override
  Future<Either<Failure, List<Credential>>> getLisCredentials(String codCliente, int codEmpresa) async {
    try {
      final credentialResponse = await credentialDataSource.getcredentialsByContractor(codCliente, codEmpresa);
      return Right(credentialResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, int>> enabledCredential(int actionCode, int code, String userName, String created) async {
    try {
      final response = await credentialDataSource.enabledCredential(actionCode, code, userName, created);
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

}