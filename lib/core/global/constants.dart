import 'package:smart/domain/entities/context_type.dart';

class Constants {

  static String wassengerKey = "6f498f7cadd8521ac69752540c197a8e00bef7816fb3781d7d9ec12b69a9c4bb7318762e22ea7816";

  static List<String> statesRequest = [
    "Todos",
    "Autorizado",
    "Autorizado Parcial",
    "Observado",
    "Pendiente",
    "Completado",
    "Vencido",
    "Enviado",
  ];

  static List<String> statesCredential = [
    "Todos",
    "Completado",
    "Pendiente",
  ];

  static List<ContextType> contexts = [
    ContextType(codigo: 1, descripcion: "Planta"),
    ContextType(codigo: 2, descripcion: "Flota"),
  ];

  static List<String> alertType = [
    "AVISO SMART - Solicitud Autorizada Incompleta", 
    "AVISO SMART - Solicitud Autorizada Completa", 
    "AVISO SMART - Documento próximo a vencer", 
    "AVISO SMART - Documento Observado", //
    "AVISO SMART - Nueva Solicitud", 
    "AVISO SMART - Solicitud Completada", 
    "AVISO SMART - Solicitud Observada" //
  ]; 

}
