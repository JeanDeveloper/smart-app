import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/presentation/blocs/contractor/campus/campus_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_request/create_request_bloc.dart';
import 'package:smart/presentation/blocs/contractor/entry_type/entry_type_bloc.dart';
import 'package:smart/presentation/blocs/contractor/representative/representative_bloc.dart';
import 'package:smart/presentation/blocs/contractor/solicitud/solicitud_bloc.dart';
import 'package:smart/presentation/blocs/contractor/sucursal/sucursal_bloc.dart';
import 'package:smart/presentation/screens/contractor/request/widgets/body_container.dart';
import 'package:smart/presentation/screens/contractor/screen.dart';
import 'package:smart/presentation/widgets/background_request.dart';

class RequestScreen extends StatelessWidget {

  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entryTypeBloc     = BlocProvider.of<EntryTypeBloc>(context);
    final sucursalBloc      = BlocProvider.of<SucursalBloc>(context);
    final campusBloc         =   BlocProvider.of<CampusBloc>(context);
    final representativeBloc = BlocProvider.of<RepresentativeBloc>(context);
    final createRequestBloc   =  BlocProvider.of<CreateRequestBloc>(context);
    final solicitudBloc =  BlocProvider.of<SolicitudBloc>(context);

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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'create-request-button',

        onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => CreateRequestScreen(entryTypeBloc: entryTypeBloc, sucursalBloc: sucursalBloc, campusBloc: campusBloc,representativeBloc: representativeBloc,createRequestBloc: createRequestBloc, solicitudBloc: solicitudBloc))),
        child: const Icon(Icons.add),
      ),
    );
  }
}