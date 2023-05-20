import 'package:equatable/equatable.dart';

class PersonRequestContractor extends Equatable{
  String fullname;
  String nroDoc;
  String cargo;
  String area;
  String motivo;
  String tipotrabajo;
  DateTime fechaIniPer;
  DateTime fechaFinPer;
  int codDetPersona;
  int cumple;
  int noCumple;
  int porcentaje;
  int hayObs;
  int aprobado;
  bool tieneQr;
  int autorizado;
  int estadoBloqueado;

  PersonRequestContractor({
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
    required this.noCumple,
    required this.porcentaje,
    required this.hayObs,
    required this.aprobado,
    required this.tieneQr,
    required this.autorizado,
    required this.estadoBloqueado,
  });
  
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
    noCumple,
    porcentaje,
    hayObs,
    aprobado,
    tieneQr,
    autorizado,
    estadoBloqueado
  ];

}
