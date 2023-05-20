import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/domain/entities/person_request_contractor.dart';
import 'package:smart/presentation/screens/contractor/detail_request/widgets/person_document_request.dart';

class CardPersonRequest extends StatelessWidget {

  final PersonRequestContractor personRequest;
  final ContractorRequest request;
  const CardPersonRequest({super.key, required this.personRequest, required this.request});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

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
                  onTap: () => Navigator.push( context, MaterialPageRoute(builder: ( _ ) => PersonDocumentRequestC( personRequest: personRequest, request: request))),
                  child: ListTile(

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( StringUtils.converString(personRequest.fullname), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: (personRequest.autorizado == 1) ? Colors.green: Colors.grey ), maxLines: 2, overflow: TextOverflow.ellipsis),
                        Text(StringUtils.converString(personRequest.nroDoc), style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),

                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringUtils.converString(personRequest.cargo), style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                            Text(StringUtils.converString(personRequest.tipotrabajo), style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(StringUtils.converString(personRequest.area),     style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                            Text(personRequest.fechaIniPer.toString().substring(0, 11), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.green), maxLines: 2, overflow: TextOverflow.ellipsis),
                            Text(personRequest.fechaFinPer.toString().substring(0, 11), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.red), maxLines: 2, overflow: TextOverflow.ellipsis),
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