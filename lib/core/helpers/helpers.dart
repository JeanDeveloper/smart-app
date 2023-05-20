import 'package:smart/domain/entities/document_permission.dart';

class HelperUtils{

  static bool isExpired( String date ){

    final DateTime now = DateTime.now();
    // String dateInverted =  "";
    // if( date == "No requiere") return false;
    // final changedDate = date.replaceAll('/', '-');

    // if(date.length == 10){
    //   for (var i = changedDate.length - 1; i >= 0; i--) {
    //     dateInverted += String.fromCharCode(changedDate.runes.elementAt(i));
    //   } 
    // }else{
    //   dateInverted = date;
    // }

    final dateParsed = DateTime.tryParse(date);
    if( dateParsed!.compareTo(now) > 0 ) return false;
    return true;

  }


  static bool canAprove(List<DocumentPermission> docPermissions, int codDoc){
    final items  = docPermissions.where((permission) => permission.codDoc == codDoc ).toList();
    if(items.isEmpty) return false;
    return true;
  }




}