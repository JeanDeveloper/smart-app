import 'package:smart/domain/repositories/istatus_repository.dart';
import 'package:smart/domain/request/observation_request.dart';

class AddState{

  final IStatusRepository iStatusRepository;
  AddState(this.iStatusRepository);

  Future<int> call( int codSolDoc, int codEstado, String? obs,  String creadoPor) async {
    final request = RegisterStatusRequest(
      codEstado: codEstado, 
      codSolDoc: codSolDoc,
      obs: obs ,
      creadoPor: creadoPor,
    );
    return iStatusRepository.registerStatus(request);
  }


}