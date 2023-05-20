import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/data/datasources/request_datasource.dart';
import 'package:smart/domain/entities/campus.dart';
import 'package:smart/domain/entities/comment.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/domain/entities/entry_type.dart';
import 'package:smart/domain/entities/general_document.dart';
import 'package:smart/domain/entities/general_document_contractor.dart';
import 'package:smart/domain/entities/observation.dart';
import 'package:smart/domain/entities/person_document_request.dart';
import 'package:smart/domain/entities/person_document_request_contractor.dart';
import 'package:smart/domain/entities/person_request.dart';
import 'package:smart/domain/entities/person_request_autority.dart';
import 'package:smart/domain/entities/person_request_contractor.dart';
import 'package:smart/domain/entities/representative.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/entities/state_course.dart';
import 'package:smart/domain/entities/sucursal.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/observation_request.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/request/register_status_request.dart';
import 'package:smart/domain/request/request_request.dart';
import 'package:smart/domain/response/request_response.dart';
import 'package:dartz/dartz.dart';

class RequestRepository extends IRequestRepository{

  final IRequestDataSource requestDataSource;
  RequestRepository(this.requestDataSource);
  
  @override
  Future<Either<Failure, List<Solicitud>>> getListRequests(RequestListRequest request) async {
    try {
      final requestsResponse = await requestDataSource.getRequests(request);
      return Right(requestsResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }
  
  @override
  Future<Either<Failure, List<GeneralDocument>>> getListGeneralDetailRequest(GeneralDetailRequestListRequest request) async {

    try {
      final documentResponse = await requestDataSource.getGeneralDocuments(request);
      return Right(documentResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
    

  }

  @override
  Future<Either<Failure, List<PersonRequest>>> getListPersonDetailRequest(GeneralDetailRequestListRequest request) async {
    try {
      final personsResponse = await requestDataSource.getPersonsRequest(request);
      return Right(personsResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 

  }

  @override
  Future<Either<Failure, List<PersonDocumentRequest>>> getListPersonDocumentRequest(PersonDocumentRequestListRequest request) async {
    try {
      final documentsResponse = await requestDataSource.getDocumentsPersonRequest(request);
      return Right(documentsResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<Observation>>> getObservations(int code) async {
    try {
      final observationResponse = await requestDataSource.getObservations(code);
      return Right(observationResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<CourseState?> getInductionCourseState(CourseStateRequest request) async {
    try {
      final stateResponse = await requestDataSource.getInductionCourseState(request);
      return stateResponse;
    } on ServerException {
      return Future.error(1) ;
    } 
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments(int code)async {
    try {
      final commentResponse = await requestDataSource.getComments(code);
      return Right(commentResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }
  
  @override
  Future<int> registerStatus(RegisterStatusRequest request) async {
    try {
      final registerResponse = await requestDataSource.registerStatus(request);
      return registerResponse;
    } on ServerException {
      return Future.error(1) ;
    }
  }

  @override
  Future<Either<Failure, List<PersonRequestAutority>>> getListPersonsRequestAutority(int headCode) async {
    try {
      final  registerResponse = await requestDataSource.getPersonsAutority(headCode);
      return Right(registerResponse);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<ContractorRequest>>> getListRequestsByContractor(int enterpriseCode, String customerCode) async {
    try {
      final  response = await requestDataSource.getContractorRequests(enterpriseCode, customerCode);
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<EntryType>>> getListEntryType(String customerCode) async{
    try {
      final  response = await requestDataSource.getListEntryType( customerCode );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<Sucursal>>> getListSucursal(String customerCode, String conText) async {
    try {
      final  response = await requestDataSource.getListSucursal( customerCode, conText );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<Representative>>> getListRepresentative(int codSede) async {
    try {
      final  response = await requestDataSource.getListRepresentative( codSede );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<Campus>>> getListSede(int codSede) async {
    try {
      final  response = await requestDataSource.getListSede( codSede );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<CreateRequestResponse> registerRequest(CreateRequestRequest request) async {
    try {
      final  response = await requestDataSource.createRequest( request );
      return response;
    } on ServerException {
      return Future.error(1);
    } 
  }

  @override
  Future<Either<Failure, int>> updateCodeEncrypt(int codCabecera, String codeEncrypt) async {
    try {
      final  response = await requestDataSource.updateCodeEncrypt( codCabecera, codeEncrypt );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
    
  }

  @override
  Future<int> registerStatusRequest(RegisterStatusRequestRequest request)  async {
  try {
      final registerResponse = await requestDataSource.registerRequestStatus(request);
      return registerResponse;
    } on ServerException {
      return Future.error(1) ;
    }
  }

  @override
  Future<Either<Failure, List<GeneralDocumentContractor>>> getListGeneralDetailRequestContractor(int codCabecera) async {
    try {
      final  response = await requestDataSource.getGeneralDocumentsContractor( codCabecera );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<PersonRequestContractor>>> getListPersonDetailRequestContractor(int codCabecera) async {
    try {
      final  response = await requestDataSource.getPersonsRequestContractor( codCabecera );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

  @override
  Future<Either<Failure, List<PersonDocumentRequestContractor>>> getListPersonDocumentRequestContractor(int codDetPersona) async{
    try {
      final  response = await requestDataSource.getDocumentsPersonRequestContractor( codDetPersona );
      return Right(response);
    } on ServerException {
      return Left( ServerFailure( message: "Ha ocurrido un problema en el servidor" ) );
    } 
  }

}