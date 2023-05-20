
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/domain/entities/person_request_contractor.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/person_document/person_document_cont_bloc.dart';
import 'package:smart/presentation/widgets/tile_document_individual_contractor.dart';

class PersonDocumentRequestC extends StatefulWidget {

  final PersonRequestContractor  personRequest;
  final ContractorRequest request;

  const PersonDocumentRequestC({super.key, required this.personRequest, required this.request});

  @override
  State<PersonDocumentRequestC> createState() => _PersonDocumentRequestCState();

}

class _PersonDocumentRequestCState extends State<PersonDocumentRequestC> {

  @override
  void initState() {
      BlocProvider.of<PersonDocumentContBloc>(context).add(InitialEvent(widget.personRequest.codDetPersona));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;
    // final personDocumentInitial  = PersonDocumentInitialRequest(widget.personRequest.codDetPersona!, user!.userName, CourseStateRequest(widget.request.ruc, widget.personRequest.nroDoc?? '',user.codCliente, widget.request.encryptCode));

    return Scaffold(

      appBar: AppBar(title: Text( " ${StringUtils.converString(widget.personRequest.fullname)} - ${StringUtils.converString(widget.personRequest.cargo)}", maxLines: 2)),

      body: BlocBuilder<PersonDocumentContBloc, PersonDocumentContState>(
        builder: (context, state) {

          if( state is PersonDocumentContLoading ) return const Center(child: CircularProgressIndicator());
          
          if( state is PersonDocumentContError )   return Center(child: Text(state.message));

          if( state is PersonDocumentContLoaded ){
            final documents    = state.documents;
            if( documents.isEmpty) return const Center(child: Text("No hay informacion"));
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: ( _ , i) => TilePersonDocumentContractor( document: documents[i] , request: widget.request ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}