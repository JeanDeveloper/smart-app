import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/person_document_request.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/request_request.dart';

class GetListPersonDocument{
  final IRequestRepository iRequestRepository;
  GetListPersonDocument(this.iRequestRepository);

  Future<Either<Failure, List<PersonDocumentRequest>>> call( int codDetPersona, String userName) async {
    final request = PersonDocumentRequestListRequest(codDetPersona,userName);
    return iRequestRepository.getListPersonDocumentRequest(request);
  }

}