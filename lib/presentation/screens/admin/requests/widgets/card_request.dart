import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/helpers/multi_select_dialog.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/blocs/admin/authority/authority_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/screens/admin/detail-request/detail_request.dart';

class CardRequest extends StatelessWidget {
  final Solicitud request;
  const CardRequest({
    super.key, 
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute( builder: ( _ ) => DetailRequestScreen( request: request))),
      onLongPress: ((user?.codTipoUsuario == 1 || user?.userName == 'egomez') && request.endState != 5 ) 
        ? () {
          BlocProvider.of<AuthorityBloc>(context).add(LoadPersonsAuthority(request.code));
          showDialogMultiSelect(context, request);
        }
        : null,
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
                  Text("${request.code}",  style: const TextStyle(fontSize: 12)),
                  Text(StringUtils.converString(request.enterPrise), style: const TextStyle(fontSize: 12),),
                  Text(StringUtils.converString(request.typeEntry),  style: const TextStyle(fontSize: 12)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringUtils.converString(request.subCampus),  style: const TextStyle(fontSize: 12)),
                      Text(request.startDate.toString().substring(0,10),  style: const TextStyle(fontSize: 12)),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${request.nroPeople}",  style: const TextStyle(fontSize: 12)),
                      Text(request.endDate.toString().substring(0,10),  style: const TextStyle(fontSize: 12)),
                    ],
                  ),

                ],
              ),
            ),

            Container(
              height: size.height * .03,
              decoration: BoxDecoration(
                color: findColor(request.status),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
              ),
              child: Center(child: Text(StringUtils.converString(request.status), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
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
