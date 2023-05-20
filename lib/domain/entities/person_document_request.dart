import 'package:equatable/equatable.dart';

class PersonDocumentRequest extends Equatable{
  PersonDocumentRequest({
    required this.codigo,
    required this.codEstadoSolDoc,
    required this.codDoc,
    required this.nombre,
    required this.cargadoVerificador,
    this.fechaCarga,
    this.fechaEmision,
    this.fechaCaducidad,
    required this.dosis,
    this.rutaArchivo,
    required this.estadoFecha,
    required this.aprobado,
    required this.estado,
    this.observaciones,
    required this.permisoAprobacion,
  });

  int codigo;
  int codEstadoSolDoc;
  int codDoc;
  String nombre;
  bool cargadoVerificador;
  String? fechaCarga;
  String? fechaEmision;
  String? fechaCaducidad;
  String? dosis;
  String? rutaArchivo;
  bool estadoFecha;
  int aprobado;
  String estado;
  String? observaciones;
  int permisoAprobacion;
  
  @override

  List<Object?> get props => [
    codigo,
    codEstadoSolDoc,
    codDoc,
    nombre,
    cargadoVerificador,
    fechaCarga,
    fechaEmision,
    fechaCaducidad,
    dosis,
    rutaArchivo,
    estadoFecha,
    aprobado,
    estado,
    observaciones,
    permisoAprobacion,
  ];
}
