import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/entry_type.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListEntryType{
  final IRequestRepository iRequestRepository;
  GetListEntryType(this.iRequestRepository);
  Future<Either<Failure, List<EntryType>>> call( String customerCode) async {
    return iRequestRepository.getListEntryType(customerCode);
  }
}

