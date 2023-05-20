import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/response/contractor_response.dart';

abstract class IContractorRepository{
  Future< Either<Failure, List<ContractorResponse>>>getListContractors( String  customerCode );
}