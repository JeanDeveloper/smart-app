class Credential {

  final String ruc;
  final String enterprise;
  final String representative;
  final String item;
  final int    userQuantity;
  final String email;
  final String numberPhone;
  final bool isActivate;

  Credential(
    this.ruc,
    this.enterprise,
    this.representative,
    this.item,
    this.userQuantity,
    this.email,
    this.numberPhone,
    this.isActivate
  );

}


final credentials = [
  Credential("20608159151", "CKYAN FABRICACIONES Y MONTAJES INDUSTRIALES SAC", "DIOS BACA EDDIE GIANCARLO", 
"INSTALACIÓN DE MAQUINARIA Y EQUIPO INDUSTRIALES", 1, "EDIOS@KYANSAC.COM", "942767851", false),
  Credential("20600909011", "JOV TELECOMUNICACIONES Y REDES E.I.R.L.	", "JULIO CESAR ORTIZ VILELA	", "TELECOMUNICACIONES",
      1, "JORTIZ@JOVTELECOMUNICACIONES.COM", "044664821", true),
  Credential("20608159151", "CKYAN FABRICACIONES Y MONTAJES INDUSTRIALES SAC", "DIOS BACA EDDIE GIANCARLO", 
"INSTALACIÓN DE MAQUINARIA Y EQUIPO INDUSTRIALES", 1, "EDIOS@KYANSAC.COM", "942767851", false),
  Credential("20600909011", "JOV TELECOMUNICACIONES Y REDES E.I.R.L.	", "JULIO CESAR ORTIZ VILELA	", "TELECOMUNICACIONES",
      1, "JORTIZ@JOVTELECOMUNICACIONES.COM", "044664821", false),
        Credential("20608159151", "CKYAN FABRICACIONES Y MONTAJES INDUSTRIALES SAC", "DIOS BACA EDDIE GIANCARLO", 
"INSTALACIÓN DE MAQUINARIA Y EQUIPO INDUSTRIALES", 1, "EDIOS@KYANSAC.COM", "942767851", true),
  Credential("20600909011", "JOV TELECOMUNICACIONES Y REDES E.I.R.L.	", "JULIO CESAR ORTIZ VILELA	", "TELECOMUNICACIONES",
      1, "JORTIZ@JOVTELECOMUNICACIONES.COM", "044664821", false),
];
