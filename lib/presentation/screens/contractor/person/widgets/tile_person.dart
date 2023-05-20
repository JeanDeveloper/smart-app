import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/person_per_enterprise.dart';


class TilePerson extends StatelessWidget {

  final PersonPerEnterprise person;
  
  const TilePerson({super.key, required this.person});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return  InkWell(
    
      // onTap: ( document.rutaArchivo == null ) ? null :() async {
      //   final file = await ApiView.loadNetwork(document.rutaArchivo!);
      //   // ignore: use_build_context_synchronously
      //   Navigator.push(context, MaterialPageRoute( builder: (context) =>  PDFViewerPage(file: file) ));
      // },
    
      // onLongPress: ( document.aprobado == 4 || document.fechaCarga == null || HelperUtils.isExpired(document.fechaCaducidad.toString()) || !HelperUtils.canAprove(user!.docPermissions!, document.codDocumento))
      //   ? null
      //   : ( document.aprobado == 6 )
      //     ? () => showAlertDialog(context, '¿Desea desaprobar al personal?', () {
      //       BlocProvider.of<GeneralDocumentBloc>(context).add(AddStatusEvent(document.codigo, user.userName, request.code, 7, user.userName));
      //       Navigator.pop(context);
      //     }) 
      //   :() => showAlertDialog(context, '¿Desea aprobar el documento?',  (){
      //     BlocProvider.of<GeneralDocumentBloc>(context).add(AddStatusEvent(document.codigo, user.userName, request.code, 6, user.userName));
      //     Navigator.pop(context);
      //   }),
    
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
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
    
          child: ListTile(
            title: Row(
              children: [
    
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(StringUtils.converString(person.fullname), style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
                      Text(StringUtils.converString(person.dni), style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),

                // Expanded(
                //   flex:2 ,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Text((document.fechaEmision!.year == 1) ? '' : document.fechaEmision.toString().substring(0,11), style: Theme.of(context).textTheme.bodySmall!.copyWith( color: SmartColors.lightGreen)),
                //       Text((document.fechaCaducidad!.year  == 1) ? '' : document.fechaCaducidad.toString().substring(0,11), style: Theme.of(context).textTheme.bodySmall!.copyWith( color: SmartColors.red)),
                //       if( document.tieneLista )
                //         InkWell(
                //           onTap: () {
                //             BlocProvider.of<GeneralPersonDocBloc>(context).add(ShowListPersonEvent(document.codigo));
                //             showSheetMultiSelect(context);
                //           },
                //           child: ButtonIcon(
                //             color: (document.estado2 != 'COMPLETO') ? SmartColors.purple  : SmartColors.red,  
                //             icon: FontAwesomeIcons.peopleGroup
                //           )
                //         ),
                //     ],
                //   ),
                // ),
              ],
            ),
            trailing: Icon(Icons.check_circle, color: (person.verificado) ?Colors.blue : Colors.grey ),
          ),
        ),
      ),
    );

  }
}