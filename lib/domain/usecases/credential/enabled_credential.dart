import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/icredential_repository.dart';

class EnabledCredential{
  final ICredentialRepository icredentialRepository;
  EnabledCredential(this.icredentialRepository);
  Future<Either<Failure, int>> call(int actionCode, int code, String userName, String created) async {
    return icredentialRepository.enabledCredential(actionCode, code, userName, created );
  }
}