import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/general_document/general_document_contractor_bloc.dart';
import 'package:smart/presentation/screens/contractor/detail_request/widgets/card_general_document.dart';


class GeneralDetailRequest extends StatefulWidget {

  final ContractorRequest request;

  const GeneralDetailRequest({super.key, required this.request});

  @override
  State<GeneralDetailRequest> createState() => _GeneralDetailRequestState();
}

class _GeneralDetailRequestState extends State<GeneralDetailRequest> {

  @override
  void initState() {
    final user =  BlocProvider.of<AuthBloc>(context).user;
    BlocProvider.of<GeneralDocumentContractorBloc>(context).add(GeneralDocumentInitialContractor(widget.request.cabecera));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final user = BlocProvider.of<AuthBloc>(context).user;

    return BlocBuilder<GeneralDocumentContractorBloc, GeneralDocumentContractorState>(
      builder: (context, state) {
        // if( state is GeneralDocumentInitialContractor ) BlocProvider.of<GeneralDocumentContractorBloc>(context).add(GeneralDocumentContractorInitial(widget.request));
        if( state is GeneralDocumentContractorLoading ) const Center(child: CircularProgressIndicator());
        if( state is GeneralDocumentContractorError   ) Center(child: Text(state.message));
        if( state is GeneralDocumentContractorLoaded  ){
          final generalDocuments = state.generaldocuments;
          return SizedBox.expand(
            child: ListView.builder(
              itemCount: generalDocuments.length,
              itemBuilder: ( _ , i) => CardGeneralDocumentC(document: generalDocuments[i], request: widget.request ),
            ) 
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}