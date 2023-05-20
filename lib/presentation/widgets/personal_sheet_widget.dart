import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalSheetWidget extends StatelessWidget {
  const PersonalSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 500,
      child: Center(
        child: Column(
          children: <Widget>[

              //TODO: CANTIDAD DE PERSONA
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