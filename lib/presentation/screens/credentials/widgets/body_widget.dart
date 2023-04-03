import 'package:flutter/material.dart';
import 'package:smart/data/models/credential_model.dart';
import 'package:smart/presentation/screens/credentials/widgets/widgets.dart';
import 'package:smart/presentation/theme/theme.dart';


class BodyWidget extends StatelessWidget {

  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final size  =  MediaQuery.of(context).size;
    return Column(
      children: [

        const Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Buscar",
              hintStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: SmartColors.lightBlue,
              prefixIcon: Icon( Icons.search, color: Colors.black )
            ),
          ),
        ),

        const StateWidget(),

        Container(
          padding: const EdgeInsets.only( top: 48 ),
          height: size.height * .62 , 
          width: double.infinity,
          child: ListView.builder(
            itemCount: credentials.length,
            itemBuilder: ( _ , i) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardCredential(credential: credentials[i]),
            ),
          ),
        ),

      ],
    );
  }
}