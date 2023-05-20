import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/request/person_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/observation/observation_bloc.dart';
import 'package:smart/presentation/widgets/widgets.dart';
import 'package:smart/domain/entities/person_document_request.dart';

class ObsPersWidget extends StatelessWidget {

  PersonDocumentRequest document;
  Solicitud request;
  final PersonDocumentInitialRequest personDocumentInitial;

  ObsPersWidget({super.key,required this.document, required this.personDocumentInitial, required this.request});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ObservationBloc>()),
      ], 
      child: ObsPersWidgetInit(document: document,personDocumentInitial: personDocumentInitial, request: request),
    );
  }

}


class ObsPersWidgetInit extends StatefulWidget {
  PersonDocumentRequest document;
  Solicitud request;
  final PersonDocumentInitialRequest personDocumentInitial;

  ObsPersWidgetInit({
    super.key,
    required this.document, 
    required this.personDocumentInitial,
    required this.request,
  });

  @override
  State<ObsPersWidgetInit> createState() => _ObsPersWidgetInitState();

}

class _ObsPersWidgetInitState extends State<ObsPersWidgetInit> {

  @override
  void initState() {
    super.initState();
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

                if( state is ObservationLoading ){
                  const Expanded(child: Center(child: CircularProgressIndicator()));
                }

                if( state is ObservationLoaded ){
                  return Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 20,
                    child: Text("${state.observations.length} Observacion(es)", textAlign: TextAlign.center),
                  );
                }

                if(state is ObservationError){
                  return const Center(child: Text("Hay un problema con el servifor"));
                }

                return ShimmerWidget(
                  width: size.width * .5,
                  height: size.height *.03,
                );

              },
            ),

            // CAJA DE TEXTO
            Container(
              color: Colors.white,
              height: 70,
              child: InputMessagePerson(document: widget.document, typeMessage: 1, personDocumentInitial: widget.personDocumentInitial, request: widget.request),
            ),

            const Divider( height: 1 ),

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
                            TextSpan(text: "${observations[i].observacion}", style: const TextStyle(fontWeight: FontWeight.bold)) 
                          ]
                        ),
                      )
                    )
                  );
                }

                if(state is ObservationError){
                  return const Center(child: Text("Hay un problema con el servifor"));
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