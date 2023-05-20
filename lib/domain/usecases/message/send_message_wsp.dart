import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/imessage_repository.dart';

class SendMessageWsp{
  final IMessageRepository iMessageRepository;
  SendMessageWsp(this.iMessageRepository);
  Future<Either<Failure, int> > call( String codeEncrypt, int codTipoEnvio, String documentName, String createdBy ) async {
    return iMessageRepository.sendMsgWsp( codeEncrypt, documentName, 1, createdBy );
  }
}