import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/comment.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListComments{
  final IRequestRepository iRequestRepository;
  GetListComments(this.iRequestRepository);
  Future<Either<Failure, List<Comment>>> call( int code) async {
    return iRequestRepository.getComments(code);
  }
}

