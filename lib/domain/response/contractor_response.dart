import 'package:equatable/equatable.dart';

class ContractorResponse extends Equatable {
  ContractorResponse({
    required this.codigo,
    required this.codigoEmpresa,
    this.razonSocial,
    this.ruc,
    required this.codeEncrypt,
    required this.rubro,
    required this.representante,
    this.cantUsers,
    this.estado,
  });

  int codigo;
  int? codigoEmpresa;
  String? razonSocial;
  String? ruc;
  String? codeEncrypt;
  String? rubro;
  String? representante;
  int? cantUsers;
  bool? estado;
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    codigo,
    codigoEmpresa,
    razonSocial,
    ruc,
    codeEncrypt,
    rubro,
    representante,
    cantUsers,
    estado,
  ];

}
