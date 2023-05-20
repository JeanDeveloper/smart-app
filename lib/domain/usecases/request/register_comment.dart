

import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/observation_request.dart';

class RegisterComment{
  final IRequestRepository iRequestRepository;
  RegisterComment(this.iRequestRepository);
  Future< int > call( int codSolDoc, int codEstado, String obs, String creadoPor )async {
    final request = RegisterStatusRequest(codSolDoc: codSolDoc, codEstado: codEstado, obs: obs, creadoPor: creadoPor);
    return iRequestRepository.registerStatus(request);
  }
}