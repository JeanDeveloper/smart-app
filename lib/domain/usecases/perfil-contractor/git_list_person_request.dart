import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_request_contractor.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListPersonRequestContractor{
  final IRequestRepository iRequestRepository;
  GetListPersonRequestContractor(this.iRequestRepository);
  Future<Either<Failure, List<PersonRequestContractor>>> call( int codCabecera) async {
    return iRequestRepository.getListPersonDetailRequestContractor(codCabecera);
  }
}