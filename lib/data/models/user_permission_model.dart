
import 'dart:convert';

import 'package:smart/domain/entities/user_permission.dart';

List<UserPermissionModel> userPermissionModelFromJson(String str) => List<UserPermissionModel>.from(json.decode(str).map((x) => UserPermissionModel.fromJson(x)));

String userPermissionModelToJson(List<UserPermissionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPermissionModel extends UserPermission {
  UserPermissionModel({
    required this.codigo,
    required this.codMenu,
    required this.nombreMenu,
    required this.codSubMenu,
    this.nombreSubMenu,
  }) : super(
    codigo: codigo, 
    codMenu: codMenu, 
    nombreMenu: nombreMenu, 
    codSubMenu: codSubMenu
  );

  @override
  int codigo;
  @override
  int codMenu;
  @override
  String nombreMenu;
  @override
  int codSubMenu;
  @override
  String? nombreSubMenu;

  factory UserPermissionModel.fromJson(Map<String, dynamic> json) => UserPermissionModel(
    codigo: json["codigo"],
    codMenu: json["codMenu"],
    nombreMenu: json["nombreMenu"],
    codSubMenu: json["codSubMenu"],
    nombreSubMenu: json["nombreSubMenu"],
  );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "codMenu": codMenu,
    "nombreMenu": nombreMenu,
    "codSubMenu": codSubMenu,
    "nombreSubMenu": nombreSubMenu,
  };
}
