import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/domain/entities/person_document_request.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/domain/request/person_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/comment/bloc/comment_bloc.dart';
import 'package:smart/presentation/widgets/widgets.dart';

class CommentPersWidget extends StatelessWidget {

  PersonDocumentRequest document;
  Solicitud request;
  final PersonDocumentInitialRequest personDocumentInitial;

  CommentPersWidget({super.key,required this.document, required this.personDocumentInitial, required this.request});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CommentBloc>()),
      ], 
      child:  CommentPersWidgetJ(document: document,personDocumentInitial: personDocumentInitial, request: request),
    );
  }

}


class CommentPersWidgetJ extends StatefulWidget {
  PersonDocumentRequest document;
  Solicitud request;
  final PersonDocumentInitialRequest personDocumentInitial;

  CommentPersWidgetJ({super.key,required this.document, required this.personDocumentInitial, required this.request});
  @override
  State<CommentPersWidgetJ> createState() => _CommentPersWidgetJState();
}

class _CommentPersWidgetJState extends State<CommentPersWidgetJ> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CommentBloc>(context).add(ShowCommentsEvent(widget.document.codigo));
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

            BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {

                if( state is CommentLoading){
                  const Expanded(child: Center(child: CircularProgressIndicator()));
                }

                if( state is CommentLoaded ){
                  //CANTIDAD DE COMENTARIOS
                  return Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 20,
                    child: Text("${state.comments.length} Comentario(s)", textAlign: TextAlign.center,),
                  );
                }

                if( state is CommentError ){
                  return const Center(child: Text("Hay un problema con el servidor"));
                }

                return ShimmerWidget(
                  width: size.width * .5,
                  height: size.height *.03,
                );

              },
            ),

            //CAJA DE TEXTO
            Container(
              color: Colors.white,
              height: 70,
              child: InputMessagePerson(document: widget.document, typeMessage: 2, personDocumentInitial: widget.personDocumentInitial, request: widget.request),
            ),

            const Divider( height: 1 ),

            BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                if( state is CommentLoading ){
                  const Expanded(child: Center(child: CircularProgressIndicator()));
                }
                if( state is CommentLoaded ){
                final comments = state.comments;
                if( comments.isEmpty ) return const Center(child: Text("No hay comentarios anteriores"));
                  return Flexible(
                    child: ListView.builder(
                      itemCount: comments.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ( _ , i) => RichText(
                        text:TextSpan(
                          text: comments[i].creado.toString().substring(0,19),
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(text: "   ${comments[i].observacion}", style: const TextStyle(fontWeight: FontWeight.bold)) 
                          ]
                        ),
                      )
                    )
                  );
                }
                if(state is CommentError){
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