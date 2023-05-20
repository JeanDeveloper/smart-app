import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_per_enterprise.dart';
import 'package:smart/domain/repositories/iperson_repository.dart';

class GetPersonsPerEnterPrise{

  final IPersonRepository iPersonRepository;
  GetPersonsPerEnterPrise(this.iPersonRepository);

  Future<Either<Failure, List<PersonPerEnterprise>>> call( String codCliente, int codEmpresa) async {
    return iPersonRepository.getPersonListforEnterprise(codCliente, codEmpresa);
  }

}