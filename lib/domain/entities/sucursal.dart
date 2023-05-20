import 'package:equatable/equatable.dart';

class Sucursal extends Equatable {
  int codigo;
  String codCliente;
  String descripcion;
  bool habilitado;
  int codSucursal;
  int ambito;

  Sucursal({
    required this.codigo,
    required this.codCliente,
    required this.descripcion,
    required this.habilitado,
    required this.codSucursal,
    required this.ambito,
  });

  @override
  List<Object?> get props => [
    codigo,
    codCliente,
    descripcion,
    habilitado,
    codSucursal,
    ambito,
  ];

}
