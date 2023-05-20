import 'package:equatable/equatable.dart';

class RegisterMsgWspRequest extends Equatable{
  String codEnvio;
  String idApi;
  String telefono;
  String codigoPers;
  String dni;
  String nombre;
  String mensaje;
  String idArchivo;
  String error;
  String creadoPor;
  String? validaNum;

  RegisterMsgWspRequest({
    required this.codEnvio,
    required this.idApi,
    required this.telefono,
    required this.codigoPers,
    required this.dni,
    required this.nombre,
    required this.mensaje,
    required this.idArchivo,
    required this.error,
    required this.creadoPor,
    this.validaNum,
  });

  @override
  List<Object?> get props => [
    codEnvio,
    idApi,
    telefono,
    codigoPers,
    dni,
    nombre,
    mensaje,
    idArchivo,
    error,
    creadoPor,
    validaNum,
  ];

}
