import 'package:get_it/get_it.dart';
import 'package:smart/data/datasources/auth_datasource.dart';
import 'package:smart/data/datasources/contractor_datasource.dart';
import 'package:smart/data/datasources/credential_datasource.dart';
import 'package:smart/data/datasources/local_storage_datasource.dart';
import 'package:smart/data/datasources/message_datasource.dart';
import 'package:smart/data/datasources/person_datasource.dart';
import 'package:smart/data/datasources/request_datasource.dart';
import 'package:smart/data/datasources/status_datasource.dart';
import 'package:smart/data/repositories/auth_repository.dart';
import 'package:smart/data/repositories/contractor_repository.dart';
import 'package:smart/data/repositories/credential_repository.dart';
import 'package:smart/data/repositories/local_storage_repository.dart';
import 'package:smart/data/repositories/message_repository.dart';
import 'package:smart/data/repositories/person_repository.dart';
import 'package:smart/data/repositories/request_repository.dart';
import 'package:smart/data/repositories/status_repository.dart';
import 'package:smart/domain/repositories/iauth_repository.dart';
import 'package:smart/domain/repositories/icontractor_repository.dart';
import 'package:smart/domain/repositories/icredential_repository.dart';
import 'package:smart/domain/repositories/ilocal_storage_repository.dart';
import 'package:smart/domain/repositories/imessage_repository.dart';
import 'package:smart/domain/repositories/iperson_repository.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/repositories/istatus_repository.dart';
import 'package:smart/domain/usecases/auth/login.dart';
import 'package:smart/domain/usecases/authority/get_persons_authority.dart';
import 'package:smart/domain/usecases/authority/register_authorized_persons.dart';
import 'package:smart/domain/usecases/contractor/get_contractors.dart';
import 'package:smart/domain/usecases/credential/enabled_credential.dart';
import 'package:smart/domain/usecases/credential/get_credentials.dart';
import 'package:smart/domain/usecases/local_storage/get_mode.dart';
import 'package:smart/domain/usecases/local_storage/save_mode.dart';
import 'package:smart/domain/usecases/local_storage/delete_data.dart';
import 'package:smart/domain/usecases/local_storage/save_data.dart';
import 'package:smart/domain/usecases/message/send_message_wsp.dart';
import 'package:smart/domain/usecases/perfil-contractor/get_list_general_documents.dart';
import 'package:smart/domain/usecases/perfil-contractor/get_list_person_document.dart';
import 'package:smart/domain/usecases/perfil-contractor/git_list_person_request.dart';
import 'package:smart/domain/usecases/person/add_person_doc_gen.dart';
import 'package:smart/domain/usecases/person/get_general_person_doc.dart';
import 'package:smart/domain/usecases/person/get_induction_course_state.dart';
import 'package:smart/domain/usecases/person/get_persons_per_enterprise.dart';
import 'package:smart/domain/usecases/person/register_person.dart';
import 'package:smart/domain/usecases/request/add_request.dart';
import 'package:smart/domain/usecases/request/get_contractor_request.dart';
import 'package:smart/domain/usecases/request/get_list_campus.dart';
import 'package:smart/domain/usecases/request/get_list_comments.dart';
import 'package:smart/domain/usecases/request/get_list_entry_type.dart';
import 'package:smart/domain/usecases/request/get_list_general_document.dart';
import 'package:smart/domain/usecases/request/get_list_observations.dart';
import 'package:smart/domain/usecases/request/get_list_person_document.dart';
import 'package:smart/domain/usecases/request/get_list_person_request.dart';
import 'package:smart/domain/usecases/request/get_list_representative.dart';
import 'package:smart/domain/usecases/request/get_list_sucursal.dart';
import 'package:smart/domain/usecases/request/get_request.dart';
import 'package:smart/domain/usecases/request/register_comment.dart';
import 'package:smart/domain/usecases/request/register_observation.dart';
import 'package:smart/domain/usecases/request/send_inform_contractor.dart';
import 'package:smart/domain/usecases/request/update_code_encrypt.dart';
import 'package:smart/domain/usecases/splash/data_validate.dart';
import 'package:smart/domain/usecases/status/add_status.dart';
import 'package:smart/presentation/blocs/admin/authority/authority_bloc.dart';
import 'package:smart/presentation/blocs/admin/contractor/contractor_bloc.dart';
import 'package:smart/presentation/blocs/admin/credential/credential_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/comment/bloc/comment_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/general_document/general_document_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/observation/observation_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_document/person_document_request_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_request/person_request_bloc.dart';
import 'package:smart/presentation/blocs/admin/person/general_person_doc/general_person_doc_bloc.dart';
import 'package:smart/presentation/blocs/admin/request/request_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/auth/get_user.dart';
import 'package:smart/presentation/blocs/contractor/campus/campus_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_person/create_person_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_request/create_request_bloc.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/general_document/general_document_contractor_bloc.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/person_document/person_document_cont_bloc.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/person_request/person_request_cont_bloc.dart';
import 'package:smart/presentation/blocs/contractor/entry_type/entry_type_bloc.dart';
import 'package:smart/presentation/blocs/contractor/inform/inform_contractor_bloc.dart';
import 'package:smart/presentation/blocs/contractor/person/person_bloc.dart';
import 'package:smart/presentation/blocs/contractor/representative/representative_bloc.dart';
import 'package:smart/presentation/blocs/contractor/solicitud/solicitud_bloc.dart';
import 'package:smart/presentation/blocs/contractor/sucursal/sucursal_bloc.dart';
import 'package:smart/presentation/blocs/profile/profile_bloc.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;

Future<void> init() async{

  //AUTH BLOC
  //BLOC
  sl.registerLazySingleton(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));
  //CASO DE USO
  sl.registerFactory(() => HasLogin(sl()));
  //REPOSITORIO
  sl.registerFactory<IAuthRepository>(() => AuthRepository(sl()) );
  //DATASOURCE
  sl.registerFactory<IAuthDataSource>(() =>  AuthDataSource(sl()));
  
  //LIBRERIAS EXTERNAS
  sl.registerFactory(() => http.Client());

  //PROFILE BLOC
  sl.registerFactory(() => ProfileBloc(sl(), sl()));

  //LOCAL_REMOTE
  //CASO DE USO
  sl.registerLazySingleton(() => SaveData(sl()));
  sl.registerLazySingleton(() => SaveMode(sl()));
  //REPOSITORIO
  sl.registerFactory<ILocalStorageRepository>( () => LocalStorageRepository(sl()) );
  sl.registerFactory<ILocalStorageDataSource>( () => LocalStorageDataSource(sl()) );

  //SPLASH BLOC
  //BLOC
  //sl.registerFactory(() => SplashBloc(sl()));

  //USE CASE
  sl.registerLazySingleton(() => DataValidate(sl(), sl()));
  sl.registerLazySingleton(() => DeleteData(sl()));
  sl.registerLazySingleton(() => GetUserStorage(sl()));
  sl.registerLazySingleton(() => GetModeOfStorage(sl()));

  //CONTRACTOR
  sl.registerLazySingleton<IContractorDataSource>(() => ContractorDataSource(sl()));
  sl.registerLazySingleton<IContractorRepository>(() => ContractorRepository(sl()));
  sl.registerFactory(() => GetContractors(sl()));
  sl.registerFactory(() => ContractorBloc(sl()));

  //REQUEST
  sl.registerLazySingleton<IRequestDataSource>(() => RequestDataSource(sl()));
  sl.registerLazySingleton<IRequestRepository>(() => RequestRepository(sl()));
  sl.registerFactory(() => GetRequests(sl()));
  sl.registerFactory(() => RequestBloc(sl()));

  //GENERALDOCUMENT
  sl.registerLazySingleton(() => GetListGeneralDocument(sl()));
  sl.registerFactory(() => GeneralDocumentBloc(sl(), sl()));

  //PERSONREQUEST
  sl.registerFactory(() => GetListPersonRequest(sl()));
  sl.registerFactory(() => PersonRequestBloc(sl()));


  //PERSONDOCUMENT
  sl.registerFactory(() => GetListPersonDocument(sl()));
  sl.registerFactory(() => PersonDocumentRequestBloc(sl(), sl(), sl()));

  //OBSERVATION
  sl.registerFactory(() => GetListObservations(sl()));
  sl.registerFactory(() => ObservationBloc(sl(), sl()));
  sl.registerFactory(() => RegisterObservation(sl(), sl()));
  sl.registerFactory(() => GetInductionCourseState(sl()));

  //LIST_PERSONS_DOC
  sl.registerLazySingleton<IPersonDataSource>(() => PersonDataSource(sl()));
  sl.registerLazySingleton<IPersonRepository>(() => PersonRepository(sl()));
  sl.registerFactory(() => GetGeneralListPersonDoc(sl()));
  sl.registerFactory(() => GeneralPersonDocBloc(sl(), sl()));

  //COMMENT
  sl.registerFactory(() => GetListComments(sl()));
  sl.registerFactory(() => CommentBloc(sl(), sl()));
  sl.registerFactory(() => RegisterComment(sl()));

  //CREDENTIAL
  sl.registerLazySingleton<ICredentialDataSource>(() => CredentialDataSource(sl()));
  sl.registerLazySingleton<ICredentialRepository>(() => CredentialRepository(sl()));
  sl.registerFactory(() => GetCredentials(sl()));
  sl.registerFactory(() => EnabledCredential(sl()));
  sl.registerFactory(() => CredentialBloc(sl(), sl()));

  //STATUS
  sl.registerLazySingleton<IStatusDataSource>(() => StatusDataSource(sl()));
  sl.registerLazySingleton<IStatusRepository>(() => StatusRepository(sl()));

  sl.registerFactory(() => AddState(sl()));

  sl.registerFactory(() => GetAuthorityPersons(sl()));
  sl.registerFactory(() => AuthorityBloc(sl(), sl()));

  //CONTRACTOR_REQUEST
  sl.registerFactory(() => GetContractorRequests(sl()));
  sl.registerFactory(() => SolicitudBloc(sl()));


  sl.registerFactory(() => GetListEntryType(sl()));
  sl.registerFactory(() => EntryTypeBloc(sl()));
  sl.registerFactory(() => GetListSucursal(sl()));
  sl.registerFactory(() => SucursalBloc(sl()));

  sl.registerFactory(() => GetListCampus(sl()));
  sl.registerFactory(() => CampusBloc(sl()));

  sl.registerFactory(() => GetListRepresentative(sl()));
  sl.registerFactory(() => RepresentativeBloc(sl()));
  sl.registerFactory(() => AddRequest(sl()));
  sl.registerFactory(() => CreateRequestBloc(sl(), sl()));
  sl.registerFactory(() => UpdateCodeEncrypt(sl(), sl()));
  sl.registerFactory(() => GetPersonsPerEnterPrise(sl()));
  sl.registerFactory(() => PersonBloc(sl()));
  sl.registerFactory(() => CreateNewPerson(sl()));
  sl.registerFactory(() => CreatePersonBloc(sl()));
  sl.registerFactory(() => AddPersonDocGen(sl()));
  sl.registerFactory(() => RegisterAuthorizedPersons(sl(), sl()));

  //ENVIO DE MENSAJE AL WSP 
  sl.registerLazySingleton<IMessageDataSource>(() => MessageDataSource(sl()));
  sl.registerLazySingleton<IMessageRepository>(() => MessageRepository(sl()));
  sl.registerFactory(() => SendMessageWsp(sl()));

  sl.registerFactory(() => InformContractorBloc(sl()));
  sl.registerFactory(() => EnviarInformContractor(sl()));


  //CONTRATISTA
  sl.registerLazySingleton(() => GetListGeneralDocumentC(sl()));
  sl.registerFactory(() => GeneralDocumentContractorBloc(sl()));

  sl.registerLazySingleton(() => PersonRequestContBloc(sl()));
  sl.registerFactory(() => GetListPersonRequestContractor(sl()));

  sl.registerLazySingleton(() => PersonDocumentContBloc(sl()));
  sl.registerFactory(() => GetListPersonDocumentC(sl()));


}

