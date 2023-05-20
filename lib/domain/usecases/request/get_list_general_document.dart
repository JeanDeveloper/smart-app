import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/general_document.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/request_request.dart';

class GetListGeneralDocument{
  final IRequestRepository iRequestRepository;
  GetListGeneralDocument(this.iRequestRepository);

  Future<Either<Failure, List<GeneralDocument>>> call( String codCabecera, String userName) async {
    final request = GeneralDetailRequestListRequest(codCabecera,userName);
    return iRequestRepository.getListGeneralDetailRequest(request);
  }

}