import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/response/contractor_response.dart';
import 'package:smart/domain/repositories/icontractor_repository.dart';

class GetContractors{
  final IContractorRepository icontractorRepository;
  GetContractors(this.icontractorRepository);
  Future<Either<Failure, List<ContractorResponse>>> call( String customerCode) async {
    return icontractorRepository.getListContractors(customerCode);
  }
}