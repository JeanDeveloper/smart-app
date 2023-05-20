import 'dart:convert';

import 'package:smart/domain/entities/person_per_enterprise.dart';

List<PersonPerEnterpriseModel> personPerEnterpriseModelFromJson(String str) => List<PersonPerEnterpriseModel>.from(json.decode(str).map((x) => PersonPerEnterpriseModel.fromJson(x)));

String personPerEnterpriseModelToJson(List<PersonPerEnterpriseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonPerEnterpriseModel extends PersonPerEnterprise{
  @override
  String fullname;
  @override
  String dni;
  @override
  bool verificado;

  PersonPerEnterpriseModel({
    required this.fullname,
    required this.dni,
    required this.verificado,
  }) : super(fullname: fullname, dni: dni, verificado: verificado);

  factory PersonPerEnterpriseModel.fromJson(Map<String, dynamic> json) => PersonPerEnterpriseModel(
    fullname: json["fullname"],
    dni: json["dni"],
    verificado: json["verificado"],
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "dni": dni,
    "verificado": verificado,
  };
}
