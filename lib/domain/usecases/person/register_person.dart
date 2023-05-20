import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/iperson_repository.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/response/create_person_response.dart';

class CreateNewPerson{
  final IPersonRepository iPersonRepository;
  CreateNewPerson(this.iPersonRepository);
  Future<Either<Failure, CreatePersonResponse>> call( CreatePersonRequest request) async {
    return iPersonRepository.registerPerson(request);
  }
}