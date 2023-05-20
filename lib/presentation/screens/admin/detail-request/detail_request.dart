import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndialog/ndialog.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_request/person_request_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/inform/inform_contractor_bloc.dart';
import 'package:smart/presentation/screens/admin/detail-request/widgets/widgets.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DetailRequestScreen extends StatelessWidget {

  final Solicitud request;
  const DetailRequestScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PersonRequestBloc>()),
        BlocProvider(create: (_) => sl<InformContractorBloc>())
      ], 
      child: DetailRequestScreenW(request: request),
    );
  }

}

class DetailRequestScreenW extends StatefulWidget {

  final Solicitud request;
  const DetailRequestScreenW({
    super.key, 
    required this.request
  });
  @override
  State<DetailRequestScreenW> createState() => _DetailRequestScreenWState();

}

class _DetailRequestScreenWState extends State<DetailRequestScreenW> {

  int _currentIndex =  0;

  @override
  Widget build(BuildContext context) {

    CustomProgressDialog progressDialog = CustomProgressDialog(
        context,
        blur: 10,
      );

    return BlocListener<InformContractorBloc, InformContractorState>(
      listener: (context, state) {

        if( state is InformContractorLoading ){
          progressDialog.setLoadingWidget(const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red)));
          progressDialog.show();
        }

        if( state is InformContractorLoaded ){
          progressDialog.dismiss();
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              backgroundColor: Colors.green,
              message: "Alerta enviada exitosamente",
            ),
          );
        }

        if( state is InformContractorError ){
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              backgroundColor: Colors.red,
              message: state.message,
            ),
          );
        }

      },

      child: Scaffold(

        appBar: AppBar(
          title: Text("${widget.request.enterPrise} - ${widget.request.code}" ),
          elevation: 0,
        ),

        body: IndexedStack(
          index: _currentIndex,
          children: [
            GeneralDetailRequest(request: widget.request),
            IndividualDetailRequest(request:  widget.request),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.campaign),
          onPressed: (){
            final user =  BlocProvider.of<AuthBloc>(context).user;
            NAlertDialog(
              title: const Text("Informacion"),
              content: const Text("¿Estas Seguro?"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("No")),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  BlocProvider.of<InformContractorBloc>(context).add(SendInformContractor(widget.request.encryptCode, user!.userName));
                }, child: const Text("Si")),
              ],
            ).show(context);

          },
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.file), 
              label: "General"
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.peopleGroup), 
              label: "Personas" 
            )
          ]
        ),

      ),
    );

  }
}