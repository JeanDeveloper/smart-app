class RequestListRequest{
  RequestListRequest(this.codCliente, this.userCode);
  final String codCliente;
  final int userCode;
}

class GeneralDetailRequestListRequest{
  GeneralDetailRequestListRequest(this.codCabecera, this.userName);
  final String codCabecera;
  final String userName;
}


class PersonDocumentRequestListRequest{
  final int codDetPersona;
  final String userName;
  PersonDocumentRequestListRequest(this.codDetPersona, this.userName);
}

class CreateRequestRequest{

  final int codTipoIngreso;
  final String codCliente;
  final int codEmpresa;
  final int codSede;
  final int codSubSede;
  final int codAmbito;
  final int codAutorizante;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String creadoPor;
  final bool habilitado;

  CreateRequestRequest(
    this.codTipoIngreso, 
    this.codCliente, 
    this.codEmpresa, 
    this.codSede, 
    this.codSubSede, 
    this.codAutorizante, 
    this.fechaInicio, 
    this.fechaFin, 
    this.creadoPor, 
    this.habilitado, 
    this.codAmbito
  );

}