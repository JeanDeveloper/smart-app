import 'package:equatable/equatable.dart';

class Credential extends Equatable{
    Credential({
        required this.codigo,
        required this.fullname,
        required this.email,
        required this.usuario,
        required this.habilitado,
        required this.telefono,
        required this.fechaCreacion,
    });

    int codigo;
    String fullname;
    String email;
    String usuario;
    bool habilitado;
    String telefono;
    DateTime fechaCreacion;
    
      @override
      List<Object?> get props => [
        codigo,
        fullname,
        email,
        usuario,
        habilitado,
        telefono,
        fechaCreacion,
      ];
}
