import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/imessage_repository.dart';

class EnviarInformContractor{
  final IMessageRepository imessageRepository ;
  EnviarInformContractor(this.imessageRepository);
  Future<Either<Failure, int>> call( String codeEncrypt, String createdBy) async {
    return imessageRepository.sendMsgWsp(codeEncrypt, "", 2, createdBy);
  }
}