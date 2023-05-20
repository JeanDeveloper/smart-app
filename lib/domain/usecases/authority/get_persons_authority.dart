import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_request_autority.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetAuthorityPersons{

  final IRequestRepository irequestRepository;
  GetAuthorityPersons(this.irequestRepository);
  Future<Either<Failure, List<PersonRequestAutority>>> call( int headCode) async {
    return irequestRepository.getListPersonsRequestAutority(headCode);
  }

}