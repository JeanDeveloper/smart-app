import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/data/models/credential_model.dart';

class CardCredential extends StatelessWidget {
  final Credential credential;

  const CardCredential({
    super.key, 
    required this.credential
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dismissible(
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
      ),
      key: const Key("delete"),
      child: GestureDetector(
        onLongPress: (){},
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(credential.ruc,  style: const TextStyle(fontSize: 12)),
                          Text(StringUtils.converString(credential.enterprise), style: const TextStyle(fontSize: 12),),
                          Text(StringUtils.converString(credential.item),  style: const TextStyle(fontSize: 12)),
                          Text(StringUtils.converString(credential.representative),  style: const TextStyle(fontSize: 12)),
                          Text(StringUtils.converString(credential.email),  style: const TextStyle(fontSize: 12)),

                          // Row(
                          //   children: [
                          //     SizedBox(width: size.width * .35,),
                          //     Text(StringUtils.converString(request.startDate),  style: const TextStyle(fontSize: 12)),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Text(credential.numberPhone,  style: const TextStyle(fontSize: 12)),
                              SizedBox(width: size.width * .58,),
                              Text("${credential.userQuantity}",  style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: size.height * .03,
                  decoration: BoxDecoration(
                    color: (credential.isActivate) ? Colors.lightBlueAccent : Colors.orange,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                  ),
                  child: Center(child: Text( (credential.isActivate) ? "Completado"   : "Pendiente", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                )
              ],
            ),
          ),
      ),
    );
  }

  Color findColor(int status) {
    switch (status) {
      case 1:
        return Colors.lightBlueAccent;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.red;
      case 5:
        return Colors.green;
      case 6:
        return Colors.yellow;
      case 7:
        return Colors.lightGreenAccent;
      default:
        return Colors.black;
    }
  }

  String findStatusName(int status) {
    switch (status) {
      case 1:
        return "Aprobado";
      case 2:
        return "Pendiente";
      case 3:
        return "Enviado";
      case 4:
        return "Observado";
      case 5:
        return "Autorizado";
      case 6:
        return "Completado";
      case 7:
        return "Parcialmente";
      default:
        return "Autorizado";
    }
  }

}
