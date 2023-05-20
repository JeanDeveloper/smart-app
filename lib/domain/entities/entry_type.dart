import 'package:equatable/equatable.dart';

class EntryType extends Equatable {
  int codigo;
  String descripcion;

  EntryType({
    required this.codigo,
    required this.descripcion,
  });

  @override
  List<Object?> get props => [
    codigo,
    descripcion
  ];

}
