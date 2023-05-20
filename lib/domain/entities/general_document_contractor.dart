import 'package:equatable/equatable.dart';

class GeneralDocumentContractor extends Equatable{
  int codigo;
  String nombre;
  int codDocumento;
  String? rutaFormato;
  String periodo;
  int meses;
  DateTime fechaCarga;
  DateTime fechaEmision;
  DateTime fechaCaducidad;
  String rutaArchivo;
  String nombreArchivo;
  String nombreOriginal;
  bool cumplio;
  bool tieneLista;
  String? estado2;
  String estado;
  String estadoAdmin;
  int fechaActualizar;

  GeneralDocumentContractor({
    required this.codigo,
    required this.nombre,
    required this.codDocumento,
    this.rutaFormato,
    required this.periodo,
    required this.meses,
    required this.fechaCarga,
    required this.fechaEmision,
    required this.fechaCaducidad,
    required this.rutaArchivo,
    required this.nombreArchivo,
    required this.nombreOriginal,
    required this.cumplio,
    required this.tieneLista,
    this.estado2,
    required this.estado,
    required this.estadoAdmin,
    required this.fechaActualizar,
  });
  
  @override

  List<Object?> get props => [
    codigo,
    nombre,
    codDocumento,
    rutaFormato,
    periodo,
    meses,
    fechaCarga,
    fechaEmision,
    fechaCaducidad,
    rutaArchivo,
    nombreArchivo,
    nombreOriginal,
    cumplio,
    tieneLista,
    estado2,
    estado,
    estadoAdmin,
    fechaActualizar
  ];

}
