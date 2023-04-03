import 'package:flutter/material.dart';
import 'package:smart/data/models/request_model.dart';
import 'package:smart/presentation/screens/requests/widgets/card_request.dart';
import 'package:smart/presentation/screens/requests/widgets/widgets.dart';
import 'package:smart/presentation/theme/theme.dart';

class BodyContainer extends StatelessWidget {

  const BodyContainer({super.key});

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
              prefixIcon: Icon(Icons.search, color: Colors.black, )
            ),
          ),
        ),

        const StateContainer(),

        Container(
          padding: EdgeInsets.only( top: size.aspectRatio * 50 ),
          height: size.height * .65, 
          width: double.infinity,
          child: ListView.builder(
            itemCount: requests.length,
            itemBuilder: ( _ , i) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardRequest(request: requests[i]),
            ),
          ),
        ),

      ],
    );
  }
}