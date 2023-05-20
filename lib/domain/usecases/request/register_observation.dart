import 'package:smart/domain/request/observation_request.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/repositories/imessage_repository.dart';

class RegisterObservation{
  final IRequestRepository iRequestRepository;
  final IMessageRepository iMessageRepository;
  RegisterObservation(this.iRequestRepository, this.iMessageRepository);
  Future<int> call( String codeEncrypt,int codSolDoc, int codEstado, String obs, String creadoPor, String documentName ) async {
    final request = RegisterStatusRequest(codSolDoc: codSolDoc, codEstado: codEstado, obs: obs, creadoPor: creadoPor);
    iRequestRepository.registerStatus(request);
    final resp = await iMessageRepository.sendMsgWsp(codeEncrypt, documentName, 1, creadoPor);
    return 1;
  }
}