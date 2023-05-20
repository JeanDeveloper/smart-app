import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/response/contractor_response.dart';
import 'package:smart/presentation/screens/admin/contractor/widgets/widgets.dart';

class CardContractor extends StatelessWidget {

  final ContractorResponse contractor;

  const CardContractor({
    super.key, 
    required this.contractor
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
        context, 
        MaterialPageRoute(
          builder: ( _ ) => CredentialScreen(contractor: contractor)
        )
      ),
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
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contractor.ruc??'',  style: const TextStyle(fontSize: 12)),
                        SizedBox( width: size.width * .8, child: Text(StringUtils.converString(contractor.razonSocial), style: TextStyle(fontSize: 12),  maxLines: 2, overflow: TextOverflow.ellipsis)),
                        SizedBox( width: size.width * .8, child: Text(StringUtils.converString(contractor.rubro), style: TextStyle(fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis) ),
                        SizedBox( width: size.width * .8, child: Text(StringUtils.converString(contractor.representante), style: TextStyle(fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis) ),
                        Text("${contractor.cantUsers}",  style: const TextStyle(fontSize: 12))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * .03,
                decoration: BoxDecoration(
                  color: (contractor.estado!) ? Colors.lightBlueAccent : Colors.orange,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                ),
                child: Center(child: Text( (contractor.estado!) ? "Completado"   :"Pendiente", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              )

            ],
          ),
        ),
    );
  }



}
