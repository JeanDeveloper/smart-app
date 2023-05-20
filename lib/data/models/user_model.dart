import 'dart:convert';
import 'package:smart/data/models/document_permission.dart';
import 'package:smart/data/models/user_permission_model.dart';
import 'package:smart/domain/entities/document_permission.dart';
import 'package:smart/domain/entities/user.dart';
import 'package:smart/domain/entities/user_permission.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User{
  UserModel({
    required this.codigo,
    required this.userName,
    required this.nombres,
    required this.apellidos,
    required this.nroDoc,
    required this.email,
    required this.telefono,
    required this.codTipoUsuario,
    required this.tipoUsuario,
    required this.codCliente,
    required this.codEmpresa,
    required this.codPersonal,
    required this.userPermissions,
    required this.docPermissions,
  }) : super(
    codigo: codigo,
    userName: userName,
    nombres: nombres, 
    apellidos: apellidos, 
    nroDoc: nroDoc, 
    email: email, 
    telefono: telefono, 
    codTipoUsuario: codTipoUsuario,
    tipoUsuario: tipoUsuario, 
    codCliente: codCliente, 
    codEmpresa: codEmpresa, 
    codPersonal: codPersonal,
    userPermissions: userPermissions,
    docPermissions: docPermissions
  );

  @override
  int codigo;
  @override
  String userName;
  @override
  String nombres;
  @override
  String apellidos;
  @override
  String nroDoc;
  @override
  String email;
  @override
  String telefono;
  @override
  int codTipoUsuario;
  @override
  String tipoUsuario;
  @override
  String codCliente;
  @override
  int codEmpresa;
  @override
  int codPersonal;
  @override
  List<UserPermission>? userPermissions;
  @override
  List<DocumentPermission>? docPermissions;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    codigo: json["codigo"],
    userName: json["usuario"],
    nombres: json["nombres"],
    apellidos: json["apellidos"],
    nroDoc: json["nroDoc"],
    email: json["email"],
    telefono: json["telefono"],
    codTipoUsuario: json["codTipoUsuario"],
    tipoUsuario: json["tipoUsuario"],
    codCliente: json["codCliente"],
    codEmpresa: json["codEmpresa"],
    codPersonal: json["codPersonal"],
    userPermissions: (json["userPermissions"] == null) ? null  : List<UserPermission>.from(json["userPermissions"].map((x) => UserPermissionModel.fromJson(x))),
    docPermissions:   (json["docPermissions"] == null) ? null : List<DocumentPermission>.from(json["docPermissions"].map((x) => DocumentPermissionModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "usuario": userName,
    "nombres": nombres,
    "apellidos": apellidos,
    "nroDoc": nroDoc,
    "email": email,
    "telefono": telefono,
    "tipoUsuario": tipoUsuario,
    "codCliente": codCliente,
    "codEmpresa": codEmpresa,
    "codPersonal": codPersonal,
    "userPermissions": userPermissions,
    "docPermissions": docPermissions,
  };

}
