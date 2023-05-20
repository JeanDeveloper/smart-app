import 'dart:convert';

import 'package:smart/domain/entities/document_permission.dart';

List<DocumentPermissionModel> documentPermissionModelFromJson(String str) => List<DocumentPermissionModel>.from(json.decode(str).map((x) => DocumentPermissionModel.fromJson(x)));

String documentPermissionModelToJson(List<DocumentPermissionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentPermissionModel extends DocumentPermission{
  DocumentPermissionModel({
    required this.codPermiso,
    required this.codDoc,
    required this.abreviatura,
  }) : super(codPermiso: codPermiso, codDoc: codDoc, abreviatura: abreviatura);

  int codPermiso;
  int codDoc;
  String abreviatura;

  factory DocumentPermissionModel.fromJson(Map<String, dynamic> json) => DocumentPermissionModel(
    codPermiso: json["codPermiso"],
    codDoc: json["codDoc"],
    abreviatura: json["abreviatura"],
  );

  Map<String, dynamic> toJson() => {
    "codPermiso": codPermiso,
    "codDoc": codDoc,
    "abreviatura": abreviatura,
  };
}
