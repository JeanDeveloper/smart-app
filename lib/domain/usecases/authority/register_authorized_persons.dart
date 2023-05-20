import 'package:smart/domain/entities/person_request_autority.dart';
import 'package:smart/domain/repositories/iperson_repository.dart';
import 'package:smart/domain/repositories/irequest_repository.dart';
import 'package:smart/domain/request/authorize_person_request.dart';
import 'package:smart/domain/request/register_status_request.dart';

class RegisterAuthorizedPersons{

  final IRequestRepository irequestRepository;
  final IPersonRepository ipersonRepository;

  RegisterAuthorizedPersons(this.irequestRepository, this.ipersonRepository);
  Future<int> call( List<PersonRequestAutority> persons, bool isComplete, int codCabecera, String created) async {

    if(isComplete){
      final RegisterStatusRequestRequest statusRequest = RegisterStatusRequestRequest(
        codCabecera: codCabecera, 
        codEstado: 5, 
        creadoPor: created
      ); 
      irequestRepository.registerStatusRequest(statusRequest);
    }else{
      final RegisterStatusRequestRequest statusRequest = RegisterStatusRequestRequest(
        codCabecera: codCabecera, 
        codEstado: 9, 
        creadoPor: created
      ); 
      irequestRepository.registerStatusRequest(statusRequest);
    }

    for (PersonRequestAutority person in persons) {
      final  AuthorizePersonRequest request = AuthorizePersonRequest(
        codCabecera: codCabecera,
        nroDoc: person.nroDoc,
        codDetPersona: person.codDetPersona,
        fechaInicio: person.fechaIniPer,
        fechaFin: person.fechaIniPer,
      );
      ipersonRepository.authorizePerson(request);
    }
    return 1;
  }

}