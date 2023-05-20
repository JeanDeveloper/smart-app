import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/observation.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListObservations{
  final IRequestRepository iRequestRepository;
  GetListObservations(this.iRequestRepository);
  Future<Either<Failure, List<Observation>>> call( int code) async {
    return iRequestRepository.getObservations(code);
  }
}