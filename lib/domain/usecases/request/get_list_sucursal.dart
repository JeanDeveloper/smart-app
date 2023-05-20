import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/sucursal.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListSucursal{
  final IRequestRepository iRequestRepository;
  GetListSucursal(this.iRequestRepository);
  Future<Either<Failure, List<Sucursal>>> call( String customerCode, String conText) async {
    return iRequestRepository.getListSucursal(customerCode, conText);
  }
}