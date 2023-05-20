import 'package:flutter/material.dart';
import 'package:smart/presentation/theme/theme.dart';

class ButtonState extends StatelessWidget {

  final String textButton;
  final bool isActive;

  const ButtonState({ 
    required this.textButton, 
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 30 ),
      decoration: BoxDecoration(
        color: (isActive) ? SmartColors.lightBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(textButton, style: const TextStyle(color: SmartColors.white)),
    );
  }

}