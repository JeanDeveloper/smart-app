import 'package:equatable/equatable.dart';

class Comment extends Equatable{
  Comment({
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
