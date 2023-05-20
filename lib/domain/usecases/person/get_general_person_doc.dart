import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/general_person_doc.dart';
import 'package:smart/domain/repositories/iperson_repository.dart';

class GetGeneralListPersonDoc{

  final IPersonRepository iPersonRepository;
  GetGeneralListPersonDoc(this.iPersonRepository);

  Future< Either<Failure, List<GeneralPersonDoc>> > call( int code) async {
    return iPersonRepository.getPersonListDoc(code);
  }

}