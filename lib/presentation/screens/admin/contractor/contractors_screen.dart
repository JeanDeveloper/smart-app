import 'package:flutter/material.dart';
import 'package:smart/presentation/screens/admin/contractor/widgets/body_widget.dart';
import 'package:smart/presentation/screens/admin/requests/widgets/widgets.dart';

class ContractorsScreen extends StatelessWidget {
  const ContractorsScreen({super.key});

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