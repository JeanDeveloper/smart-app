import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    return FaIcon(
      icon, 
      size: size.aspectRatio * 50, 
      color: color
    );

  }
}