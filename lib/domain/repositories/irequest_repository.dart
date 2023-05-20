import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/failure.dart';
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
import 'package:smart/domain/request/observation_request.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/domain/request/register_status_request.dart';
import 'package:smart/domain/request/request_request.dart';
import 'package:smart/domain/response/request_response.dart';

abstract class IRequestRepository{
  Future<Either<Failure, List<Solicitud>>>getListRequests( RequestListRequest request );
  Future<Either<Failure, List<GeneralDocument>>>getListGeneralDetailRequest( GeneralDetailRequestListRequest request );
  Future<Either<Failure, List<PersonRequest>>>getListPersonDetailRequest( GeneralDetailRequestListRequest request );
  Future<Either<Failure, List<PersonDocumentRequest>>>getListPersonDocumentRequest( PersonDocumentRequestListRequest request );
  Future<Either<Failure, List<Observation>>>getObservations( int code );
  Future<CourseState? > getInductionCourseState( CourseStateRequest request );
  Future<Either<Failure, List<Comment>>>getComments( int code );
  Future<int > registerStatus(RegisterStatusRequest request);
  Future<Either<Failure, List<PersonRequestAutority>>> getListPersonsRequestAutority(int headCode);
  Future<Either<Failure, List<ContractorRequest>>> getListRequestsByContractor(int enterpriseCode, String customerCode );
  Future<Either<Failure, List<EntryType>>> getListEntryType( String customerCode );
  Future<Either<Failure, List<Sucursal>>> getListSucursal( String customerCode, String conText );
  Future<Either<Failure, List<Campus>>> getListSede( int codSede );
  Future<Either<Failure, List<Representative>>> getListRepresentative( int codSede );
  Future<CreateRequestResponse> registerRequest( CreateRequestRequest request );
  Future<Either<Failure, int>> updateCodeEncrypt( int codCabecera, String codeEncrypt );
  Future<int> registerStatusRequest(RegisterStatusRequestRequest request);



  Future<Either<Failure, List<GeneralDocumentContractor>>>getListGeneralDetailRequestContractor( int codCabecera );
  Future<Either<Failure, List<PersonRequestContractor>>>getListPersonDetailRequestContractor( int codCabecera );
  Future<Either<Failure, List<PersonDocumentRequestContractor>>>getListPersonDocumentRequestContractor( int codDetPersona );


  // Future<int> sendMessageWsp()
}