import 'package:intl/intl.dart';



class StringUtils{

  static String converString( String? fullname ){
    if( fullname != null){
      return fullname.split(' ').map(
        (name) {
          if( name == '' ) return '';
          return name[0] + name.substring(1).toLowerCase();
        }
      ).join(' ');
    }else{
      return '';
    }
  }


  static DateTime convertStringToDateTime( String date ){

    final DateTime now = DateTime.now();

    if( date == 'No requiere' ){
      return now;
    }else{
      final dateParsed = DateTime.parse(date);
      return dateParsed;
    }
  }

}