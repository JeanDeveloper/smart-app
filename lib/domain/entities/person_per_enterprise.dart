import 'package:equatable/equatable.dart';

class PersonPerEnterprise extends Equatable {
  String fullname;
  String dni;
  bool verificado;

  PersonPerEnterprise({
    required this.fullname,
    required this.dni,
    required this.verificado,
  });
  
  @override
  List<Object?> get props => [
    fullname,
    dni,
    verificado
  ];

}
