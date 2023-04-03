import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/data/models/request_model.dart';
import 'package:smart/presentation/screens/detail-request/detail_request.dart';

class CardRequest extends StatelessWidget {
  final Request request;
  const CardRequest({
    required this.request,
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
        onTap: () => Navigator.push( context, MaterialPageRoute(
          builder: ( _ ) => const DetailRequestScreen(),
        )),
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
                      // const FaIcon(FontAwesomeIcons.personWalkingArrowRight, size: 24, color:Colors.blueGrey),
                      // SizedBox(width: size.width* 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(request.code,  style: const TextStyle(fontSize: 12)),
                          Text(StringUtils.converString(request.enterprise), style: const TextStyle(fontSize: 12),),
                          Text(StringUtils.converString(request.entryType),  style: const TextStyle(fontSize: 12)),
                          Row(
                            children: [
                              Text(StringUtils.converString(request.campus),  style: const TextStyle(fontSize: 12)),
                              SizedBox(width: size.width * .35,),
                              Text(StringUtils.converString(request.startDate),  style: const TextStyle(fontSize: 12)),
          
                            ],
                          ),
                          Row(
                            children: [
                              Text("${request.peoplecounter}",  style: const TextStyle(fontSize: 12)),
                              SizedBox(width: size.width * .58,),
                              Text(StringUtils.converString(request.endDate),  style: const TextStyle(fontSize: 12)),
          
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
                    color: findColor(request.status),
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                  ),
                  child: Center(child: Text( findStatusName(request.status), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
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
