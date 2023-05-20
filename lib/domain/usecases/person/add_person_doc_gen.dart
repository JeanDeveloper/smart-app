import 'package:smart/domain/entities/general_person_doc.dart';
import 'package:smart/domain/repositories/iperson_repository.dart';

class AddPersonDocGen{

  final IPersonRepository iPersonRepository;
  AddPersonDocGen(this.iPersonRepository);

  Future<int> call( List<GeneralPersonDoc> items, List<GeneralPersonDoc>initialPersons,  List<GeneralPersonDoc> selectedPersons, int codCabecera, int codDocumento ) async {

    if(selectedPersons.isEmpty){
      for (GeneralPersonDoc person in items){
        iPersonRepository.addPersonDocGen(person.nroDoc, codCabecera, codDocumento, 2);
      }
    }

    for (GeneralPersonDoc person in initialPersons) {
      if(!selectedPersons.contains(person)){
        iPersonRepository.addPersonDocGen(person.nroDoc, codCabecera, codDocumento, 2);
      }
    }

    for (GeneralPersonDoc person in selectedPersons) {
      if(!initialPersons.contains(person)){
        iPersonRepository.addPersonDocGen(person.nroDoc, codCabecera, codDocumento, 1);
      }
    }

    return 1;

  }

}