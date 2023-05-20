import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/campus.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListCampus{
  final IRequestRepository iRequestRepository;
  GetListCampus(this.iRequestRepository);
  Future<Either<Failure, List<Campus>>> call( int codSede) async {
    return iRequestRepository.getListSede(codSede);
  }
}

