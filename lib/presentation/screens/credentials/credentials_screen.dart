import 'package:flutter/material.dart';
import 'package:smart/presentation/screens/credentials/widgets/body_widget.dart';
import 'package:smart/presentation/screens/requests/widgets/widgets.dart';

class CredentialsScreen extends StatelessWidget {
  const CredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autorizacion de Credenciales"),
        elevation: 0,
      ),
      body: SizedBox.expand(
        child: Stack(
          children: const [
            BackGroundRequest(),
            BodyWidget()
          ],
        ),
      ),
    );
  }
}