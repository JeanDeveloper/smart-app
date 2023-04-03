import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart/data/datasources/pdf_view.dart';
import 'package:smart/presentation/screens/detail-request/widgets/button_icon.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/presentation/widgets/widgets.dart';

class DetailRequestScreen extends StatelessWidget {

  const DetailRequestScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Hydraulic Supply Company SAC - 23686"),
        elevation: 0,
      ),

      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () async {

              const url ='http://190.116.178.163/SOLGIS/FOTOS/TRAINING/00838/SGS/SCTR%20SALUD%20Y%20PENSION/115144_1012_20230401.pdf';
              final file = await ApiView.loadNetwork(url);
              // ignore: use_build_context_synchronously
              Navigator.push(context, MaterialPageRoute( builder: (context) =>  PDFViewerPage(file: file) ));

            },
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              title: Row(
                children: [

                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Estandar Preventivo del Trabajo", style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),

                  Expanded(
                    flex:2 ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("05/03/2023", style: Theme.of(context).textTheme.bodySmall!.copyWith( color: SmartColors.lightGreen)),
                        Text("10/03/2023", style: Theme.of(context).textTheme.bodySmall!.copyWith( color: SmartColors.red)),
                      ],
                    ),
                  ),

                ],
              ),
              trailing: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context, 
                        builder: (context) {
                          return Container(
                            height: 500,
                            child: Center(
                              child: Column(
                                children: <Widget>[

                                    //TODO: CANTIDAD DE COMENTARIOS
                                    Container(
                                      color: Colors.white,
                                      width: double.infinity,
                                      height: 20,
                                      child: Text("20 Comentarios", textAlign: TextAlign.center,),
                                    ),
                                    //TODO: CAJA DE TEXTO
                                    Container(
                                      color: Colors.white,
                                      height: 70,
                                      child: _inputChat(),
                                    ),
                                    const Divider( height: 1 ),
                                    Flexible(
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: ( _ , i) => Text('$i'),
                                      )
                                    ),

                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const ButtonIcon(color: Colors.blue , icon: FontAwesomeIcons.eye)
                  ),
                  const SizedBox(height: 5 ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context, 
                        builder: (context) {
                          return Container(
                            height: 500,
                            child: Center(
                              child: Column(
                                children: <Widget>[

                                    //TODO: CANTIDAD DE COMENTARIOS
                                    Container(
                                      color: Colors.white,
                                      width: double.infinity,
                                      height: 20,
                                      child: Text("20 Observaciones", textAlign: TextAlign.center,),
                                    ),
                                    //TODO: CAJA DE TEXTO
                                    Container(
                                      color: Colors.white,
                                      height: 70,
                                      child: _inputChat(),
                                    ),
                                    const Divider( height: 1 ),
                                    Flexible(
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: ( _ , i) => Text('$i'),
                                      )
                                    ),

                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },

                    child: ButtonIcon(color: SmartColors.pink, icon: FontAwesomeIcons.comment)
                  ),
                ],
              ),
            ),
          ),
        ) 
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.file), label: "Generales"),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.file), label: "Individuales" )
        ]
      ),

    );

  }



  Widget _inputChat(){

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 8 ),
        child: Row(
          children: [

            Flexible(
              child: TextField(
                onChanged: ( String texto ){
                  // TODO: CUANDO HAY UN VALOR, PARA PODER POSTEAR
                },
                // decoration: const InputDecoration.collapsed(
                //   // hintText: 'Comentario',
                // ),
                // focusNode: _focusNode,
              )
            ),

            //BOTON DE ENVIAR
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 4 ),
              child: 
                Platform.isIOS 
                  ? CupertinoButton(
                    onPressed: () {},
                    child: const Text('Enviar'),
                  )
                  : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: IconButton(
                      onPressed: (){
                        // print(_textController.text);
                      }, 
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