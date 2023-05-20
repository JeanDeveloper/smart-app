import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/domain/response/contractor_response.dart';
import 'package:smart/presentation/blocs/admin/credential/credential_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/screens/admin/contractor/widgets/widgets.dart';

class CredentialScreen extends StatelessWidget {
  final ContractorResponse contractor;
  const CredentialScreen({super.key, required this.contractor});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CredentialBloc>())
      ],
      child: CredentialScreenInit(contractor: contractor)
    );
  }
}

class CredentialScreenInit extends StatelessWidget {
  final ContractorResponse contractor;
  const CredentialScreenInit({super.key, required this.contractor});

  @override
  Widget build(BuildContext context) {

    final user = BlocProvider.of<AuthBloc>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Credenciales"),
      ),
      body: BlocBuilder<CredentialBloc, CredentialState>(
        builder: (context, state) {

          if(state is CredentialInitial){
            BlocProvider.of<CredentialBloc>(context).add(CredentialInitialEvent(user!.codCliente, contractor.codigoEmpresa?? 0));
          }

          if( state is CredentialLoading ){
            return const Center(child: CircularProgressIndicator());
          }

          if( state is CredentialLoaded ){
            final credentials = state.credentials;
            return SizedBox.expand(
              child: ListView.builder(
                itemCount: credentials.length,
                itemBuilder: (_, i) => TilePersonCredential(contractor: contractor, credential: credentials[i]),
              )
            );
          }

          return const Center(child: CircularProgressIndicator());

        },
      ),
    );
  }
}
