import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/general_document_contractor.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';

class GetListGeneralDocumentC{
  final IRequestRepository iRequestRepository;
  GetListGeneralDocumentC(this.iRequestRepository);

  Future<Either<Failure, List<GeneralDocumentContractor>>> call( int codCabecera) async {
    return iRequestRepository.getListGeneralDetailRequestContractor(codCabecera);
  }

}