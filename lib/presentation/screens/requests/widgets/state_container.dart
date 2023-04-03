import 'package:flutter/material.dart';
import 'package:smart/core/global/constants.dart';
import 'package:smart/presentation/screens/requests/widgets/widgets.dart';

class StateContainer extends StatelessWidget {
  const StateContainer({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .05,
      width:  double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constantes.statesRequest.length,
        itemBuilder: ( _ , i ) => ButtonState(
          textButton: Constantes.statesRequest[i], 
          isActive: false,
        ),
      ),
    );

  }
}