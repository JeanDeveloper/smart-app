import 'package:equatable/equatable.dart';

class ContractorRequest extends Equatable{
  ContractorRequest({
    required this.cabecera,
    required this.cantPers,
    required this.codCliente,
    required this.codeEncrypt,
    required this.ingreso,
    required this.sede,
    required this.subsede,
    required this.ambito,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estado,
    required this.estadoReal,
    required this.nombre,
  });

  int cabecera;
  int cantPers;
  String codCliente;
  String? codeEncrypt;
  String ingreso;
  String sede;
  String subsede;
  String ambito;
  DateTime fechaInicio;
  DateTime fechaFin;
  int estado;
  int estadoReal;
  String nombre;

  @override
  List<Object?> get props => [
    cabecera,
    cantPers,
    codCliente,
    codeEncrypt,
    ingreso,
    sede,
    subsede,
    ambito,
    fechaInicio,
    fechaFin,
    estado,
    estadoReal,
    nombre,
  ];
}
