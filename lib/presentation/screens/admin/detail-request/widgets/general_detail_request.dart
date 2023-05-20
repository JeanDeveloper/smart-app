import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/request/general_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/general_document/general_document_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/screens/admin/detail-request/widgets/widgets.dart';


class GeneralDetailRequest extends StatefulWidget {

  final Solicitud request;

  const GeneralDetailRequest({super.key, required this.request});

  @override
  State<GeneralDetailRequest> createState() => _GeneralDetailRequestState();
}

class _GeneralDetailRequestState extends State<GeneralDetailRequest> {


  @override
  void initState() {
      final user =  BlocProvider.of<AuthBloc>(context).user;
      BlocProvider.of<GeneralDocumentBloc>(context).add(GeneralDocumentInitialEvent("${widget.request.code}", user!.userName));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    final user =  BlocProvider.of<AuthBloc>(context).user;
    final initialRequest = GeneralDocumentInitialRequest(widget.request.code, user!.userName);

    return BlocBuilder<GeneralDocumentBloc, GeneralDocumentState>(
      builder: (context, state) {
        if( state is GeneralDocumentInitial ) BlocProvider.of<GeneralDocumentBloc>(context).add(GeneralDocumentInitialEvent("${widget.request.code}", user.userName));
        if( state is GeneralDocumentLoading ) const Center(child: CircularProgressIndicator());
        if( state is GeneralDocumentError   ) Center(child: Text(state.message));
        if( state is GeneralDocumentLoaded  ){
          final generalDocuments = state.generaldocuments;
          return SizedBox.expand(
            child: ListView.builder(
              itemCount: generalDocuments.length,
              itemBuilder: ( _ , i) => CardGeneralDocument(document: generalDocuments[i], request: widget.request, personDocumentInitial: initialRequest ),
            ) 
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}