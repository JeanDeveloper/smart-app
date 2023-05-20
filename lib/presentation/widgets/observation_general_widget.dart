import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/domain/entities/general_document.dart';
import 'package:smart/domain/request/general_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/observation/observation_bloc.dart';
import 'package:smart/presentation/widgets/widgets.dart';


class ObsGeneralWidget extends StatelessWidget {
  final GeneralDocument document;
  final GeneralDocumentInitialRequest generalDocumentInitial;
  final String encryptCode;

  const ObsGeneralWidget({
    super.key, 
    required this.document, 
    required this.generalDocumentInitial,
    required this.encryptCode
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ObservationBloc>()),
      ], 
      child: ObservationGeneralWidgetJ(document: document,generalDocumentInitial: generalDocumentInitial, encryptCode: encryptCode), 
    );
  }
}

class ObservationGeneralWidgetJ extends StatefulWidget {

  final GeneralDocument document;
  final GeneralDocumentInitialRequest generalDocumentInitial;
  final String encryptCode;

  const ObservationGeneralWidgetJ({super.key, required this.document, required this.generalDocumentInitial, required this.encryptCode});

  @override
  State<ObservationGeneralWidgetJ> createState() => _ObservationGeneralWidgetJState();
} 

class _ObservationGeneralWidgetJState extends State<ObservationGeneralWidgetJ> {
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ObservationBloc>(context).add(ShowObservationsEvent(widget.document.codigo));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .5,
      child: Center(
        child: Column(
          children: <Widget>[

            BlocBuilder<ObservationBloc, ObservationState>(
              builder: (context, state) {
                if( state is ObservationLoaded ){
                  return Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 20,
                    child: Text("${state.observations.length} Observacion(es)", textAlign: TextAlign.center),
                  );
                }
                return ShimmerWidget(
                  width: size.width * .5,
                  height: size.height *.03,
                );
              },
            ),

            Container(
              color: Colors.white,
              height: 70,
              child: InputMessageGeneral(document: widget.document, typeMessage: 1, generalDocumentInitial: widget.generalDocumentInitial, encryptCode: widget.encryptCode ),
            ),

            BlocBuilder<ObservationBloc, ObservationState>(
              builder: (context, state) {
                if( state is ObservationLoading ){
                  const Expanded(child: Center(child: CircularProgressIndicator()));
                }
                if( state is ObservationLoaded ){
                final observations = state.observations;
                if( observations.isEmpty ) return const Center(child: Text("No hay observaciones anteriores"));
                  return Flexible(
                    child: ListView.builder(
                      itemCount: observations.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ( _ , i) => RichText(
                        text:TextSpan(
                          text: observations[i].creado.toString().substring(0,11),
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(text: " ${observations[i].observacion.toLowerCase()}", style: const TextStyle(fontWeight: FontWeight.bold)) 
                          ]
                        ),
                      )
                    )
                  );
                }
                if(state is ObservationError){
                  return const Center(child: Text("Hay un problema con el servidor"));
                }
                return const Expanded(child: Center(child: CircularProgressIndicator()));
              },
            ),

          ],
        ),
      ),
    );
  }

}