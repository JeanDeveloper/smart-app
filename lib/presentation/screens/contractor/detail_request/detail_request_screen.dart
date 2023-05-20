import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/person_request/person_request_cont_bloc.dart';
import 'package:smart/presentation/screens/contractor/detail_request/widgets/general_detail_request.dart';
import 'package:smart/presentation/screens/contractor/detail_request/widgets/individual_detail_request.dart';

class DetailRequestScreen extends StatelessWidget {
  final ContractorRequest request;
  const DetailRequestScreen({super.key, required this.request});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PersonRequestContBloc>()),
        // BlocProvider(create: (_) => sl<InformContractorBloc>())
      ], 
      child: DetailRequestScreenW(request: request),
    );
  }
}

class DetailRequestScreenW extends StatefulWidget {
  final ContractorRequest request;
  const DetailRequestScreenW({
    super.key, 
    required this.request
  });
  @override
  State<DetailRequestScreenW> createState() => _DetailRequestScreenStateW();
}

class _DetailRequestScreenStateW extends State<DetailRequestScreenW> {

  int _currentIndex =  0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("${widget.request.sede} - ${widget.request.subsede}" ),
        elevation: 0,
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: [
          GeneralDetailRequest(request: widget.request),
          IndividualDetailRequest(request:  widget.request),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.campaign),
      //   onPressed: (){
      //     final user =  BlocProvider.of<AuthBloc>(context).user;
      //     NAlertDialog(
      //       title: const Text("Informacion"),
      //       content: const Text("¿Estas Seguro?"),
      //       actions: [
      //         TextButton(onPressed: (){
      //           Navigator.pop(context);
      //         }, child: const Text("No")),
      //         TextButton(onPressed: (){
      //           Navigator.pop(context);
      //           // BlocProvider.of<InformContractorBloc>(context).add(SendInformContractor(widget.request.encryptCode, user!.userName));
      //         }, child: const Text("Si")),
      //       ],
      //     ).show(context);
      //   },
      // ),

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

    );

  }
}