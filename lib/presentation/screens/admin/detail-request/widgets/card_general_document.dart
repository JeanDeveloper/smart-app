import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/helpers/helpers.dart';
import 'package:smart/domain/request/general_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/general_document/general_document_bloc.dart';
import 'package:smart/presentation/blocs/admin/person/general_person_doc/general_person_doc_bloc.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/core/helpers/alert_dialog.dart';
import 'package:smart/core/helpers/multi_select.dart';
import 'package:smart/data/datasources/pdf_view.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/widgets/widgets.dart';
import 'package:smart/domain/entities/general_document.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardGeneralDocument extends StatelessWidget {

  final GeneralDocument document;
  final Solicitud request;
  final GeneralDocumentInitialRequest personDocumentInitial;

  const CardGeneralDocument({super.key, required this.document, required this.request, required this.personDocumentInitial});

  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;
    final user =  BlocProvider.of<AuthBloc>(context).user;
    final bloc =  BlocProvider.of<GeneralPersonDocBloc>(context);

    return InkWell(

      onTap: ( document.rutaArchivo == null ) ? null :() async {
        final file = await ApiView.loadNetwork(document.rutaArchivo!);
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute( builder: (context) =>  PDFViewerPage( file: file )));
      },

      onLongPress: ( document.aprobado == 4 || document.fechaCarga == null || HelperUtils.isExpired(document.fechaCaducidad.toString()) || !HelperUtils.canAprove(user!.docPermissions!, document.codDocumento))
        ? null
        : ( document.aprobado == 6 )
          ? () => showAlertDialog(context, '¿Desea desaprobar al personal?', () {
            BlocProvider.of<GeneralDocumentBloc>(context).add(AddStatusEvent(document.codigo, user.userName, request.code, 7, user.userName));
            Navigator.pop(context);
          }) 
        :() => showAlertDialog(context, '¿Desea aprobar el documento?',  (){
          BlocProvider.of<GeneralDocumentBloc>(context).add(AddStatusEvent(document.codigo, user.userName, request.code, 6, user.userName));
          Navigator.pop(context);
        }),

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

          child: Row(
            children: [

              Container(
                height: size.height * .3,
                width: size.width * .04, 
                color: ColorUtils.findColorToDocument(document.estado),
              ),

              Expanded(
                child: ListTile(
                  title: Row(
                    children: [

                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(StringUtils.converString(document.nombre), style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
                            Text((document.fechaCarga!.year == 1) ? '' : document.fechaCarga.toString().substring(0,11), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),

                      Expanded(
                        flex:2 ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text((document.fechaEmision!.year == 1) ? '' : document.fechaEmision.toString().substring(0,11), style: Theme.of(context).textTheme.bodySmall!.copyWith( color: SmartColors.lightGreen)),
                            Text((document.fechaCaducidad!.year  == 1) ? '' : document.fechaCaducidad.toString().substring(0,11), style: Theme.of(context).textTheme.bodySmall!.copyWith( color: SmartColors.red)),

                            if( document.tieneLista )

                              InkWell(
                                onTap: () {
                                  BlocProvider.of<GeneralPersonDocBloc>(context).add(ShowListPersonEvent(document.codigo));
                                  showSheetMultiSelect(context, request.code, document.codDocumento );
                                },
                                child: ButtonIcon(
                                  color: (document.estado2 != 'COMPLETO') ? SmartColors.purple  : SmartColors.red,  
                                  icon: FontAwesomeIcons.peopleGroup
                                )
                              ),
                          ],
                        ),
                      ),

                    ],
                  ),

                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if( document.estado != 'APROBADO' && document.estadoDoc != 'PENDIENTE' )
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context, 
                              builder: (context) =>  ObsGeneralWidget(document: document, generalDocumentInitial: personDocumentInitial, encryptCode: request.encryptCode),
                            );
                          },
                          child: const ButtonIcon(color: Colors.blue , icon: FontAwesomeIcons.eye)
                        ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context, 
                            builder: (context) => CommentGeneralWidget(document: document, generalDocInitial: personDocumentInitial),
                          );
                        },

                        child: const  ButtonIcon(color: SmartColors.pink, icon: FontAwesomeIcons.comment)
                      ),

                    ],
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