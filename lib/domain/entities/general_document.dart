import 'package:equatable/equatable.dart';

class GeneralDocument extends Equatable {
  GeneralDocument({
    required this.codigo,
    required this.nombre,
    required this.tieneLista,
    required this.codDocumento,
    required this.fechaCarga,
    required this.fechaEmision,
    required this.fechaCaducidad,
    required this.rutaArchivo,
    required this.estadoDoc,
    required this.aprobado,
    required this.estado,
    this.estado2,
    this.observaciones,
    required this.permisoAprobacion,
  });

  int codigo;
  String nombre;
  bool tieneLista;
  int codDocumento;
  DateTime? fechaCarga;
  DateTime? fechaEmision;
  DateTime? fechaCaducidad;
  String? rutaArchivo;
  String estadoDoc;
  int aprobado;
  String estado;
  String? estado2;
  String? observaciones;
  bool permisoAprobacion;
  
  @override
  List<Object?> get props => [
    codigo,
    nombre,
    tieneLista,
    codDocumento,
    fechaCarga,
    fechaEmision,
    fechaCaducidad,
    rutaArchivo,
    estadoDoc,
    aprobado,
    estado,
    estado2,
    observaciones,
    permisoAprobacion
  ];
}
