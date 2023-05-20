import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/domain/entities/person_document_request.dart';
import 'package:smart/domain/request/person_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/comment/bloc/comment_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/observation/observation_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_document/person_document_request_bloc.dart';

class InputMessagePerson extends StatefulWidget {

  final PersonDocumentInitialRequest personDocumentInitial;
  final PersonDocumentRequest document;
  final int typeMessage;
  final Solicitud request;
  const InputMessagePerson({
    super.key, 
    required this.document, 
    required this.typeMessage, 
    required this.personDocumentInitial, 
    required this.request
  });

  @override
  State<InputMessagePerson> createState() => _InputMessagePersonState();

}

class _InputMessagePersonState extends State<InputMessagePerson> {

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
              : BlocProvider.value(
                value: BlocProvider.of<PersonDocumentRequestBloc>(context),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if(widget.typeMessage == 1) {
                        //TODO: POR MODIFICAR
                        BlocProvider.of<ObservationBloc>(context).add(AddObservationEvent(_messageController.text, widget.document.codigo, 4, BlocProvider.of<AuthBloc>(context).user?.userName??'', widget.request.encryptCode, widget.document.nombre ));
                        BlocProvider.of<PersonDocumentRequestBloc>(context).add(InitialEvent(widget.personDocumentInitial.codDetPerson, widget.personDocumentInitial.username, widget.personDocumentInitial.courseState));
                      }
                      if(widget.typeMessage == 2) {
                        BlocProvider.of<CommentBloc>(context).add(AddCommentEvent(_messageController.text, widget.document.codigo, 12, BlocProvider.of<AuthBloc>(context).user?.userName??''));
                        BlocProvider.of<PersonDocumentRequestBloc>(context).add(InitialEvent(widget.personDocumentInitial.codDetPerson, widget.personDocumentInitial.username, widget.personDocumentInitial.courseState));
                      }
                      _messageController.text = "";
                    } ,
                    icon: Icon(Icons.send, color: Colors.blue[400])
                  ),
                ),
              )
            )

          ],
        ),
      ) 
    );
  }
}