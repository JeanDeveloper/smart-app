import 'dart:convert';

import 'package:smart/domain/response/contractor_response.dart';

List<ContractorResponseModel> contractorResponseModelFromJson(String str) => List<ContractorResponseModel>.from(json.decode(str).map((x) => ContractorResponseModel.fromJson(x)));

String contractorResponseModelToJson(List<ContractorResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContractorResponseModel extends ContractorResponse {
  ContractorResponseModel({
      required this.codigo,
      required this.codigoEmpresa,
      this.razonSocial,
      this.ruc,
      required this.codeEncrypt,
      required this.rubro,
      required this.representante,
      this.cantUsers,
      this.estado,
  }) : super(codigo: codigo, codigoEmpresa: codigoEmpresa, razonSocial: razonSocial, 
    ruc: ruc, codeEncrypt: codeEncrypt, rubro: rubro, representante: representante, 
    cantUsers: cantUsers, estado: estado
  );

  @override
  int codigo;
  @override
  int? codigoEmpresa;
  @override
  String? razonSocial;
  @override
  String? ruc;
  @override
  String? codeEncrypt;
  @override
  String? rubro;
  @override
  String? representante;
  @override
  int? cantUsers;
  @override
  bool? estado;

  factory ContractorResponseModel.fromJson(Map<String, dynamic> json) => ContractorResponseModel(
      codigo: json["codigo"],
      codigoEmpresa: json["codigoEmpresa"],
      razonSocial: json["razonSocial"],
      ruc: json["ruc"],
      codeEncrypt: json["codeEncrypt"],
      rubro: json["rubro"],
      representante: json["representante"],
      cantUsers: json["cantUsers"],
      estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
      "codigo": codigo,
      "codigoEmpresa": codigoEmpresa,
      "razonSocial": razonSocial,
      "ruc": ruc,
      "codeEncrypt": codeEncrypt,
      "rubro": rubro,
      "representante": representante,
      "cantUsers": cantUsers,
      "estado": estado,
  };
}
