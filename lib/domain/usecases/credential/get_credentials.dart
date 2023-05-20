
import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/credential.dart';
import 'package:smart/domain/repositories/icredential_repository.dart';

class GetCredentials{

  final ICredentialRepository icredentialRepository;
  GetCredentials(this.icredentialRepository);

  Future<Either<Failure, List<Credential>>> call( String codCliente, int codEmpresa) async {
    return icredentialRepository.getLisCredentials( codCliente, codEmpresa );
  }

}