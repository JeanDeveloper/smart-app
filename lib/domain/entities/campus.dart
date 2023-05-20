import 'package:equatable/equatable.dart';

class Campus  extends Equatable{
  int codigo;
  String subsede;

  Campus({
    required this.codigo,
    required this.subsede,
  });
  
  @override
  List<Object?> get props => [
    codigo,
    subsede
  ];

}
