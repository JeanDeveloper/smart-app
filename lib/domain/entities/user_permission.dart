import 'package:equatable/equatable.dart';

class UserPermission extends Equatable{

  UserPermission({
      required this.codigo,
      required this.codMenu,
      required this.nombreMenu,
      required this.codSubMenu,
      this.nombreSubMenu,
  });

  int codigo;
  int codMenu;
  String nombreMenu;
  int codSubMenu;
  String? nombreSubMenu;

  @override

  List<Object?> get props => [
    codigo,
    codMenu,
    nombreMenu,
    codSubMenu
  ];
}
