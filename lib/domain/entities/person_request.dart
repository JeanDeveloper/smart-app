import 'package:equatable/equatable.dart';

class PersonRequest extends Equatable{

  PersonRequest({
    required this.fullname,
    required this.nroDoc,
    required this.cargo,
    required this.area,
    required this.motivo,
    required this.tipotrabajo,
    required this.fechaIniPer,
    required this.fechaFinPer,
    required this.codDetPersona,
    required this.cumple,
    required this.completado,
    required this.noCumple,
    required this.porcentaje,
    required this.hayObs,
    required this.aprobado,
    required this.tieneQr,
    required this.autorizado,
    required this.permisoAprobacion,
    required this.estadoBloqueado,
  });

  String? fullname;
  String? nroDoc;
  String? cargo;
  String? area;
  String? motivo;
  String? tipotrabajo;
  DateTime? fechaIniPer;
  DateTime? fechaFinPer;
  int? codDetPersona;
  int? cumple;
  bool? completado;
  int? noCumple;
  int? porcentaje;
  int? hayObs;
  int? aprobado;
  bool? tieneQr;
  bool? autorizado;
  bool? permisoAprobacion;
  int? estadoBloqueado;

  @override
  List<Object?> get props => [
    fullname,
    nroDoc,
    cargo,
    area,
    motivo,
    tipotrabajo,
    fechaIniPer,
    fechaFinPer,
    codDetPersona,
    cumple,
    completado,
    noCumple,
    porcentaje,
    hayObs,
    aprobado,
    tieneQr,
    autorizado,
    permisoAprobacion,
    estadoBloqueado
  ];

}
