import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/imessage_repository.dart';

class EnviarInformContractor{
  final IMessageRepository iMessageRepository;
  EnviarInformContractor(this.iMessageRepository);
  Future<Either<Failure, int >> call( String codeEncrypt, String username) async {
    return iMessageRepository.sendMsgWsp( codeEncrypt, '', 2, username );
  }
}

