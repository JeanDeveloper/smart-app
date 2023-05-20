import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/representative.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListRepresentative{
  final IRequestRepository iRequestRepository;
  GetListRepresentative(this.iRequestRepository);
  Future<Either<Failure, List<Representative>>> call( int codSede) async {
    return iRequestRepository.getListRepresentative(codSede);
  }
}

