import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/domain/entities/general_document.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/domain/request/general_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/comment/bloc/comment_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/observation/observation_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/general_document/general_document_bloc.dart';


class InputMessageGeneral extends StatefulWidget {

  final GeneralDocument document;
  final int typeMessage;
  final String encryptCode;
  final GeneralDocumentInitialRequest generalDocumentInitial;

  const InputMessageGeneral({
    super.key, 
    required this.document, 
    required this.typeMessage, 
    required this.generalDocumentInitial,
    required this.encryptCode,
  });

  @override
  State<InputMessageGeneral> createState() => _InputMessageGeneralState();

}

class _InputMessageGeneralState extends State<InputMessageGeneral> {

  late final TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 8 ),
        child: Row(
          children: [

            Flexible(
              child: TextField(
                controller: _messageController,
                autocorrect: true,
              )
            ),

            //BOTON
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 4 ),
              child: Platform.isIOS
              ? CupertinoButton(
                onPressed: () {},
                child: const Text('Enviar'),
              )

              : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (widget.typeMessage == 1) {
                      //TODO: REALIZAR EL ENVIO DEL WSP.
                      BlocProvider.of<ObservationBloc>(context).add(AddObservationEvent( _messageController.text, widget.document.codigo, 4, BlocProvider.of<AuthBloc>(context).user!.userName, widget.encryptCode, widget.document.nombre ));
                      BlocProvider.of<GeneralDocumentBloc>(context).add(GeneralDocumentInitialEvent("${widget.generalDocumentInitial.code}", widget.generalDocumentInitial.username));
                    }
                    if (widget.typeMessage == 2) {
                      BlocProvider.of<CommentBloc>(context).add(AddCommentEvent(_messageController.text, widget.document.codigo, 12, BlocProvider.of<AuthBloc>(context).user!.userName));
                      BlocProvider.of<GeneralDocumentBloc>(context).add(GeneralDocumentInitialEvent("${widget.generalDocumentInitial.code}", widget.generalDocumentInitial.username));
                    }
                    _messageController.text = "";
                  } ,
                  icon: Icon( Icons.send, color: Colors.blue[400] )
                ),
              )
            )
          ],
        ),
      ) 
    );
  }
}