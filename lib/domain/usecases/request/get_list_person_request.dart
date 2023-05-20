

import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_request.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/request_request.dart';

class GetListPersonRequest{
  final IRequestRepository iRequestRepository;
  GetListPersonRequest(this.iRequestRepository);

  Future<Either<Failure, List<PersonRequest>>> call( String codCabecera, String userName) async {
    final request = GeneralDetailRequestListRequest(codCabecera,userName);
    return iRequestRepository.getListPersonDetailRequest(request);
  }

}