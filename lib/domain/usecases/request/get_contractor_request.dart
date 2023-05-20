import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';


class GetContractorRequests{

  final IRequestRepository irequestRepository;
  GetContractorRequests(this.irequestRepository);

  Future<Either<Failure, List<ContractorRequest>>> call( int enterpriseCode, String customerCode) async {
    return irequestRepository.getListRequestsByContractor(enterpriseCode, customerCode);
  }

}