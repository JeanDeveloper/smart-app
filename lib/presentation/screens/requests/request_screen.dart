import 'package:flutter/material.dart';
import 'package:smart/presentation/screens/requests/widgets/widgets.dart';

class RequestScreen extends StatelessWidget {

  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Solicitudes de Acceso"),
        elevation: 0,
      ),

      body: SizedBox.expand(
        child: Stack(
          children: const [
            BackGroundRequest(),
            BodyContainer(),
          ],
        ),
      )

    );
  }
}