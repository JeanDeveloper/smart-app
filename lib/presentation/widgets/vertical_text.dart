import 'package:flutter/material.dart';


class VerticalText extends StatelessWidget {
  final String text;

  const VerticalText(this.text);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 0,
      // runAlignment: WrapAlignment.center,
      // spacing: 0,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text.split("").map((string) => Text(string, style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold))).toList(),
    );
  }
}