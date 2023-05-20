class CourseStateRequest{
  final String ruc;
  final String nroDoc;
  final String enterPrise;
  final String codeEncrypt;
  CourseStateRequest(
    this.ruc, 
    this.nroDoc, 
    this.enterPrise, 
    this.codeEncrypt
  );
}

class CreatePersonRequest{
  final int codPerson;
  final String codCustomer;
  final int codEmpresa;
  final int codDocType;
  final String name1;
  final String name2;
  final String surname1;
  final String surname2;
  final String document;
  final String gender;
  final String createdBy;
  final bool enabled;
  CreatePersonRequest(this.codPerson, this.codCustomer, this.codEmpresa, this.codDocType, this.name1, this.name2, this.surname1, this.surname2, this.document, this.gender, this.createdBy, this.enabled);
}