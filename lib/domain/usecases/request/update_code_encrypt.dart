import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/imessage_repository.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class UpdateCodeEncrypt{
  final IRequestRepository iRequestRepository;
  final IMessageRepository iMessageRepository;
  
  UpdateCodeEncrypt(this.iRequestRepository, this.iMessageRepository);
  Future<Either<Failure, int>> call( int  codCabecera, String codEncrypt, String createdBy) async {

    final resp = await iRequestRepository.updateCodeEncrypt( codCabecera, codEncrypt );
    await iMessageRepository.sendMsgWsp(codEncrypt, "", 3, createdBy);
    return resp;
  
  }
}

