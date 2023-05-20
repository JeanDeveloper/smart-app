import 'package:equatable/equatable.dart';

class Observation extends Equatable{
  Observation({
    required this.observacion,
    required this.creado,
  });

  String observacion;
  DateTime creado;
  
  @override
  List<Object?> get props => [
    observacion,
    creado,
  ];
}
