import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/entities/person_document_request_contractor.dart';

class GetListPersonDocumentC{
  final IRequestRepository iRequestRepository;
  GetListPersonDocumentC(this.iRequestRepository);

  Future<Either<Failure, List<PersonDocumentRequestContractor>>> call( int codDetPersona) async {
    return iRequestRepository.getListPersonDocumentRequestContractor(codDetPersona);
  }

}