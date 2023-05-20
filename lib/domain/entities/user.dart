import 'package:equatable/equatable.dart';
import 'package:smart/domain/entities/document_permission.dart';
import 'package:smart/domain/entities/user_permission.dart';

class User extends Equatable {

  User({
    required this.codigo,
    required this.userName,
    required this.nombres,
    required this.apellidos,
    required this.nroDoc,
    required this.email,
    required this.telefono,
    required this.tipoUsuario,
    required this.codTipoUsuario,
    required this.codCliente,
    required this.codEmpresa,
    required this.codPersonal,
    required this.userPermissions,
    required this.docPermissions,
  });

  int    codigo;
  String userName;
  String nombres;
  String apellidos;
  String nroDoc;
  String email;
  String telefono;
  int    codTipoUsuario;
  String tipoUsuario;
  String codCliente;
  int    codEmpresa;
  int    codPersonal;
  List<UserPermission>? userPermissions;
  List<DocumentPermission>? docPermissions;

  @override
  List<Object?> get props => [
    codigo,
    nombres, 
    apellidos, 
    nroDoc,
    email, 
    telefono,
    codTipoUsuario,
    tipoUsuario, 
    codCliente, 
    codEmpresa, 
    codPersonal,
    userPermissions,
    docPermissions
  ];

}
