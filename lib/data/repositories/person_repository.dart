import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/data/datasources/person_datasource.dart';
import 'package:smart/domain/entities/general_person_doc.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart/domain/entities/person_per_enterprise.dart';
import 'package:smart/domain/repositories/iperson_repository.dart';
import 'package:smart/domain/request/authorize_person_request.dart';
import 'package:smart/domain/response/create_person_response.dart';
import 'package:smart/domain/request/person_request.dart';

class PersonRepository extends IPersonRepository{

  final IPersonDataSource personDataSource;

  PersonRepository(this.personDataSource);

  @override
  Future<Either<Failure, List<GeneralPersonDoc>>> getPersonListDoc(int code) async {
    try {
      final personListResponse = await personDataSource.getPersonListofDoc(code);
      return Right(personListResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<PersonPerEnterprise>>> getPersonListforEnterprise(String codCliente, int codEmpresa) async {
    try {
      final personListResponse = await personDataSource.getPersonListforEnterprise(codCliente, codEmpresa);
      return Right(personListResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, CreatePersonResponse>> registerPerson(CreatePersonRequest request) async {
    try {
      final personResponse = await personDataSource.registerPerson(request);
      return Right(personResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<int> addPersonDocGen(String documento, int codCabecera, int codDocumento, int action) async {
    try {
      final personResponse = await personDataSource.addPersonDocGen(documento, codCabecera, codDocumento, action);
      return personResponse;
    }
    on ServerException {
      return Future.error(1) ;
    } 
  }

  @override
  Future<int> authorizePerson(AuthorizePersonRequest request) async{
    try {
      final personResponse = await personDataSource.authorizePerson(request);
      return personResponse;
    }
    on ServerException {
      return Future.error(1) ;
    } 

  }

}