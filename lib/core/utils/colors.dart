import 'dart:ui';

import 'package:flutter/material.dart';


class ColorUtils{

  static Color findColorToDocument( String? fullname ){
    switch (fullname) {
      case "APROBADO":
        return Colors.green;
      case "NO APROBADO":
        return Colors.amber;
      case "CORREGIDO":
        return Colors.blueAccent;
      default:
        return Colors.red;
    }
  }


  static Color findColorFromDocumentC( String? fullname ){
    switch (fullname) {
      case "VIGENTE":
        return Colors.green;
      case "NO VIGENTE":
        return Colors.amber;
      default:
        return Colors.red;
    }
  }


}