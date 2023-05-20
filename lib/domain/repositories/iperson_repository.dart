import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/request/authorize_person_request.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/entities/general_person_doc.dart';
import 'package:smart/domain/entities/person_per_enterprise.dart';
import 'package:smart/domain/response/create_person_response.dart';

abstract class IPersonRepository{
  Future< Either<Failure, List<GeneralPersonDoc>>>getPersonListDoc( int code);
  Future< Either<Failure, List<PersonPerEnterprise>>>getPersonListforEnterprise( String codCliente, int codEmpresa);
  Future< Either<Failure, CreatePersonResponse>>registerPerson( CreatePersonRequest request);
  Future< int> addPersonDocGen(String documento, int codCabecera, int codDocumento, int action);
  Future< int> authorizePerson(AuthorizePersonRequest request);
}