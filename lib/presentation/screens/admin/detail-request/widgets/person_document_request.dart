import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/person_request.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/request/person_document_initial.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_document/person_document_request_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/widgets/widgets.dart';


class PersonDocumentRequest extends StatefulWidget {

  final PersonRequest personRequest;
  final Solicitud request;

  const PersonDocumentRequest({super.key, required this.personRequest, required this.request});

  @override
  State<PersonDocumentRequest> createState() => _PersonDocumentRequestState();

}

class _PersonDocumentRequestState extends State<PersonDocumentRequest> {

  @override
  void initState() {
      final user =  BlocProvider.of<AuthBloc>(context).user;
      BlocProvider.of<PersonDocumentRequestBloc>(context).add(InitialEvent(widget.personRequest.codDetPersona!, user!.userName, CourseStateRequest(widget.request.ruc, widget.personRequest.nroDoc?? '',user.codCliente, widget.request.encryptCode)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size                   = MediaQuery.of(context).size;
    final user                   =   BlocProvider.of<AuthBloc>(context).user;
    final personDocumentInitial  = PersonDocumentInitialRequest(widget.personRequest.codDetPersona!, user!.userName, CourseStateRequest(widget.request.ruc, widget.personRequest.nroDoc?? '',user.codCliente, widget.request.encryptCode));

    return Scaffold(

      appBar: AppBar(title: Text( " ${StringUtils.converString(widget.personRequest.fullname)} - ${StringUtils.converString(widget.personRequest.cargo)}", maxLines: 2)),

      body: BlocBuilder<PersonDocumentRequestBloc, PersonDocumentRequestState>(
        builder: (context, state) {

          if( state is PersonDocumentRequestInitial ) {
            BlocProvider.of<PersonDocumentRequestBloc>(context).add(InitialEvent(widget.personRequest.codDetPersona!, user.userName, CourseStateRequest(widget.request.ruc, widget.personRequest.nroDoc?? '',user.codCliente, widget.request.encryptCode)));
          }

          if( state is PersonDocumentRequestLoading ) return const Center(child: CircularProgressIndicator());
          
          if( state is PersonDocumentRequestError )   return Center(child: Text(state.message));

          if( state is PersonDocumentRequestLoaded ){
            final documents    = state.documents;
            final cursoStatus  = state.stateCourse;
            if( documents.isEmpty) return const Center(child: Text("No hay informacion"));
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.book,  ),
                      SizedBox(width: size.width * .05 ),
                      Text((cursoStatus == null) ?"Sin curso" :"${cursoStatus.status } hasta ${cursoStatus.endDate.toString().substring(0,11) }", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: (cursoStatus == null) ?  Colors.red :Colors.green)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: ( _ , i) => TilePersonDocumentWidget( personDocumentInitial: personDocumentInitial, document: documents[i] , request: widget.request ),
                  ) 
                )
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}