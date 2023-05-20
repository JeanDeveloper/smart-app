import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_request_autority.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetPersonsRequestAutority{
  final IRequestRepository iRequestRepository;
  GetPersonsRequestAutority(this.iRequestRepository);

  Future<Either<Failure, List<PersonRequestAutority>>> call( int codCabecera) async {
    return iRequestRepository.getListPersonsRequestAutority(codCabecera);
  }

}