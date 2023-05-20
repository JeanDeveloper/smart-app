import 'package:flutter/material.dart';
import 'package:smart/presentation/theme/theme.dart';

class BackGroundRequest extends StatelessWidget {

  const BackGroundRequest({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Container(
          width: double.infinity,
          height:  double.infinity,
          color: SmartColors.blue,
        ),

        // Positioned(
        //   bottom: 0,
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       color: SmartColors.white,
        //       borderRadius: BorderRadiusDirectional.only(
        //         topStart: Radius.circular(23),
        //         topEnd: Radius.circular(23)
        //       )
        //     ),
        //     width:  size.width,
        //     height: size.height * .65,
        //   ),
        // ),

      ],
    );
  }
}