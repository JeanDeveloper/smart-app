import 'package:flutter/material.dart';
import 'package:smart/presentation/theme/theme.dart';


class DeliveryButton extends StatelessWidget {
  final VoidCallback? ontap;
  final Widget child;
  final EdgeInsets padding;

  const DeliveryButton({
    super.key, 
    this.ontap, 
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(

        decoration: BoxDecoration(
          color: SmartColors.blue,
          borderRadius: BorderRadius.circular(10)
        ),

        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}