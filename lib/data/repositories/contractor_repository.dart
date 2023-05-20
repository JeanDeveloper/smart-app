import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/data/datasources/contractor_datasource.dart';
import 'package:smart/domain/repositories/icontractor_repository.dart';
import 'package:smart/domain/response/contractor_response.dart';

class ContractorRepository extends IContractorRepository{
  final IContractorDataSource contractorDataSource;
  ContractorRepository(this.contractorDataSource);

  @override
  Future<Either<Failure, List<ContractorResponse>>> getListContractors(String customerCode) async {

    try {
      final contractorsResponse = await contractorDataSource.getContractorByCustomer(customerCode);
      return Right(contractorsResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 

  }
}