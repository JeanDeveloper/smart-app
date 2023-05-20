import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart/core/helpers/alert_dialog.dart';
import 'package:smart/core/helpers/helpers.dart';
import 'package:smart/core/utils/colors.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/data/datasources/pdf_view.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_document/person_document_request_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/presentation/widgets/widgets.dart';
import 'package:smart/domain/request/person_document_initial.dart';
import 'package:smart/domain/entities/person_document_request.dart';

class TilePersonDocumentWidget extends StatelessWidget {

  PersonDocumentRequest document;
  Solicitud request;
  final PersonDocumentInitialRequest personDocumentInitial;

  TilePersonDocumentWidget({super.key, required this.document, required this.personDocumentInitial, required this.request});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;

    return Padding(
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
        child: Row(
          children: [

            Container(
              height: size.height * .3,
              width: size.width * .04,
              color: ColorUtils.findColorToDocument(document.estado),
            ),

            Expanded(
              child: InkWell(

                //TODO: realizar por si se ve una imagen
                onTap: (document.rutaArchivo == null) ? null :() async {
                  final file = await ApiView.loadNetwork(document.rutaArchivo!);
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute( builder: (context) =>  PDFViewerPage(file: file) ));
                },

                onLongPress: ( document.aprobado == 4 || document.fechaCarga == null || !HelperUtils.canAprove(user!.docPermissions!, document.codDoc)  ) 
                  ? null 
                  : ( document.aprobado == 6 ) 
                    ? () => showAlertDialog(context, '¿Desea desaprobar el documento?', () {
                      BlocProvider.of<PersonDocumentRequestBloc>(context).add(AddStatus(document.codigo, 7, user.userName, personDocumentInitial));
                      Navigator.pop(context);
                    })
                    :() => showAlertDialog(context, '¿Desea aprobar el documento?', (){
                      BlocProvider.of<PersonDocumentRequestBloc>(context).add(AddStatus(document.codigo, 6, user.userName, personDocumentInitial));
                      Navigator.pop(context);
                    }),

                child: ListTile(

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox( width: size.width * .5, child: Text(StringUtils.converString(document.nombre),  style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis)),
                      Text( document.fechaEmision??'', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.green), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),

                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(document.dosis != null ) if(document.dosis != 'No requiere') Text(StringUtils.converString( document.dosis ),  style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis) ,
                      Text(document.fechaCarga?? '', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis,),
                      Text(document.fechaCaducidad??'', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.red), maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ],
                  ),

                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      if( document.estado != 'APROBADO' && document.fechaCarga != null)
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ( _ ) => ObsPersWidget( document: document, personDocumentInitial: personDocumentInitial, request: request),
                            );
                          },
                          child: const ButtonIcon(color: Colors.blue , icon: FontAwesomeIcons.eye)
                        ),

                      if( document.estado != 'APROBADO' || document.fechaCarga != null)  
                        const SizedBox(height: 5 ),

                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context, 
                            builder: ( _ ) => CommentPersWidget(document:document, personDocumentInitial:  personDocumentInitial, request: request),
                          );
                        },
                        child: const  ButtonIcon(color: SmartColors.pink, icon: FontAwesomeIcons.comment)
                      ),

                    ],
                  ),

                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}