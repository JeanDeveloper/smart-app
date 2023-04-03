import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart/presentation/theme/theme.dart';

class ButtonIcon extends StatelessWidget {

  final IconData icon;
  final Color color;

  const ButtonIcon({
    super.key, 
    required this.icon, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .03, 
      width: size.width * .08, 
      color: color, 
      alignment: Alignment.center, 
      child: FaIcon(
        icon, 
        size: 15, 
        color: SmartColors.white
      )
    );

  }
}