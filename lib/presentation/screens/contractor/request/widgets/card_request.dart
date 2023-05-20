import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/presentation/screens/contractor/detail_request/detail_request_screen.dart';

class CardRequest extends StatelessWidget {
  final ContractorRequest request;
  const CardRequest({
    super.key, 
    required this.request,
  }); 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(

      onTap: () => Navigator.push(context, MaterialPageRoute( builder: ( _ ) => DetailRequestScreen( request: request))),

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("${request.cabecera}",  style: const TextStyle(fontSize: 12)),
                  Text(StringUtils.converString(request.ingreso), style: const TextStyle(fontSize: 12),),
                  Text(StringUtils.converString(request.sede),  style: const TextStyle(fontSize: 12)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringUtils.converString(request.subsede),  style: const TextStyle(fontSize: 12)),
                      Text(request.fechaInicio.toString().substring(0,10),  style: const TextStyle(fontSize: 12)),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${request.cantPers}",  style: const TextStyle(fontSize: 12)),
                      Text(request.fechaFin.toString().substring(0,10),  style: const TextStyle(fontSize: 12)),
                    ],
                  ),

                ],
              ),
            ),

            Container(
              height: size.height * .03,
              decoration: BoxDecoration(
                color: findColor(request.nombre),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
              ),
              child: Center(child: Text(StringUtils.converString(request.nombre), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            )

          ],
        ),
      ),
    );
  }

  Color findColor(String status) {
    switch (status) {
      case "COMPLETADO":
        return Colors.lightBlueAccent;
      case "PENDIENTE":
        return Colors.amber;
      case "ENVIADO":
        return Colors.blue;
      case "OBSERVADO":
        return Colors.red;
      case "AUTORIZADO":
        return Colors.green;
      case "AUTO. PARCIAL":
        return Colors.green;
      case "VENCIDO":
        return Colors.grey;
      default:
        return Colors.red;
    }
  }

}
