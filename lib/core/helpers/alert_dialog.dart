import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String title, Function()? onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title),
        actions: [

          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.clear,
              color: Colors.red,
            ),
          ),

          TextButton(
            onPressed: onPressed,
            child: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),

        ],
      );
    },
  );
}
