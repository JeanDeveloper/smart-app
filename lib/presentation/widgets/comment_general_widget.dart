import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/domain/request/general_document_initial.dart';
import 'package:smart/presentation/blocs/admin/detail_request/comment/bloc/comment_bloc.dart';
import 'package:smart/presentation/widgets/widgets.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/domain/entities/general_document.dart';


class CommentGeneralWidget extends StatelessWidget {
  final GeneralDocument document;

  final GeneralDocumentInitialRequest generalDocInitial;
  const CommentGeneralWidget({super.key, required this.document, required this.generalDocInitial});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CommentBloc>()),
      ], 
      child: CommentervationGeneralWidgetJ(document: document,generalDocInitial: generalDocInitial),
    );
  }
}


class CommentervationGeneralWidgetJ extends StatefulWidget {

  final GeneralDocument document;
  final GeneralDocumentInitialRequest generalDocInitial;

  const CommentervationGeneralWidgetJ({super.key, required this.document, required this.generalDocInitial});

  @override
  State<CommentervationGeneralWidgetJ> createState() => _CommentervationGeneralWidgetJState();
} 

class _CommentervationGeneralWidgetJState extends State<CommentervationGeneralWidgetJ> {
  
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
                if( state is CommentLoaded ){
                  //TODO: CANTIDAD DE COMENTARIOS
                  return Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 20,
                    child: Text("${state.comments.length} Comentario(s)", textAlign: TextAlign.center,),
                  );
                }

                return ShimmerWidget(
                  width: size.width * .5,
                  height: size.height *.03,
                );

              },
            ),

            //TODO: CAJA DE TEXTO
            Container(
              color: Colors.white,
              height: 70,
              child: InputMessageGeneral( document: widget.document, typeMessage: 2, generalDocumentInitial: widget.generalDocInitial, encryptCode: "asdfasdfaosidfjasoidf"),
            ),

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
                          text: comments[i].creado.toString().substring(0,11),
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(text: "   ${comments[i].observacion.toLowerCase()}", style: const TextStyle(fontWeight: FontWeight.bold)) 
                          ]
                        ),
                      )
                    )
                  );
                }
                if(state is CommentError){
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

  // Widget _inputChat(){

  //   return SafeArea(
  //     child: Container(
  //       margin: const EdgeInsets.symmetric( horizontal: 8 ),
  //       child: Row(
  //         children: [

  //           Flexible(
  //             child: TextField(
  //               onChanged: ( String texto ){
  //                 // TODO: CUANDO HAY UN VALOR, PARA PODER POSTEAR
  //               },
  //             )
  //           ),

  //           //BOTON DE ENVIAR
  //           Container(
  //             margin: const EdgeInsets.symmetric( horizontal: 4 ),
  //             child: Platform.isIOS
  //               ? CupertinoButton(
  //                 onPressed: () {},
  //                 child: const Text('Enviar'),
  //               )
  //               : Container(
  //                 margin: const EdgeInsets.symmetric(horizontal: 4),
  //                 child: IconButton(
  //                   onPressed: (){}, 
  //                   icon: Icon( Icons.send, color: Colors.blue[400] )
  //                 ),
  //               )
  //           )
  //         ],
  //       ),
  //     ) 
  //   );
  // }
}