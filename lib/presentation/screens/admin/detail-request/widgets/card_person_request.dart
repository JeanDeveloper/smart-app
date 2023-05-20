import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/person_request.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/screens/admin/detail-request/widgets/widgets.dart';


class CardPersonRequest extends StatelessWidget {

  final PersonRequest personRequest;
  final Solicitud request;
  const CardPersonRequest({super.key, required this.personRequest, required this.request});

  @override
  Widget build(BuildContext newcontext) {

    final size = MediaQuery.of(newcontext).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(

        child: Container(
          width: size.width,
          height: size.height *  .1,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,  
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 1),
                spreadRadius: 1
              )
            ]
          ),
          child: Row(
            children: [
              Container(
                height: size.height * .3,
                width: size.width * .04,
                color: (personRequest.aprobado == 1) ? Colors.blue  : Colors.amber ,
              ),
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.push( newcontext, MaterialPageRoute(builder: ( _ ) => PersonDocumentRequest( personRequest: personRequest, request: request))),
                  child: ListTile(

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringUtils.converString(personRequest.fullname?? ""), style: Theme.of(newcontext).textTheme.bodySmall!.copyWith(color: (personRequest.autorizado!) ? Colors.green: Colors.grey ), maxLines: 2, overflow: TextOverflow.ellipsis),
                        Text(StringUtils.converString(personRequest.nroDoc?? ""), style: Theme.of(newcontext).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),

                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringUtils.converString(personRequest.cargo?? ""), style: Theme.of(newcontext).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                            Text(StringUtils.converString(personRequest.tipotrabajo?? ""), style: Theme.of(newcontext).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(StringUtils.converString(personRequest.area?? ""),     style: Theme.of(newcontext).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                            Text(personRequest.fechaIniPer.toString().substring(0, 11), style: Theme.of(newcontext).textTheme.bodySmall!.copyWith(color: Colors.green), maxLines: 2, overflow: TextOverflow.ellipsis),
                            Text(personRequest.fechaFinPer.toString().substring(0, 11), style: Theme.of(newcontext).textTheme.bodySmall!.copyWith(color: Colors.red), maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        )

                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}