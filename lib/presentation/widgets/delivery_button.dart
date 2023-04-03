import 'package:flutter/material.dart';
import 'package:smart/presentation/theme/theme.dart';


class DeliveryButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final EdgeInsets padding;

  const DeliveryButton({
    super.key, 
    required this.ontap, 
    required this.text, 
    this.padding = const EdgeInsets.all(14.0)
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xff294466),
              Color(0xff294466)
            ],
          ),
          borderRadius: BorderRadius.circular(10)
        ),

        child: Padding(
          padding: padding,
          child: Text(
            text, 
            style: const TextStyle( color: Colors.white ),
              textAlign: TextAlign.center,
          ),
        ),

      ),
    );
  }
}