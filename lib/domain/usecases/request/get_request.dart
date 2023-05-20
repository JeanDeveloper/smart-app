import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/request_request.dart';

class GetRequests{

  final IRequestRepository irequestRepository;
  GetRequests(this.irequestRepository);

  Future<Either<Failure, List<Solicitud>>> call( String codCliente, int userCode) async {
    final request = RequestListRequest(codCliente, userCode);
    return irequestRepository.getListRequests(request);
  }

}