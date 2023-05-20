import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/presentation/blocs/contractor/campus/campus_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_person/create_person_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_request/create_request_bloc.dart';
import 'package:smart/presentation/blocs/contractor/entry_type/entry_type_bloc.dart';
import 'package:smart/presentation/blocs/contractor/person/person_bloc.dart';
import 'package:smart/presentation/blocs/contractor/representative/representative_bloc.dart';
import 'package:smart/presentation/blocs/contractor/solicitud/solicitud_bloc.dart';
import 'package:smart/presentation/blocs/contractor/sucursal/sucursal_bloc.dart';
import 'package:smart/presentation/screens/contractor/screen.dart';
import 'package:smart/presentation/screens/profile/profile.dart';
import 'package:smart/presentation/theme/theme.dart';

class HomeScreenContract extends StatelessWidget {
  const HomeScreenContract({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SolicitudBloc>()),
        BlocProvider(create: (_) => sl<EntryTypeBloc>()),
        BlocProvider(create: (_) => sl<SucursalBloc>()),
        BlocProvider(create: (_) => sl<CampusBloc>()),
        BlocProvider(create: (_) => sl<RepresentativeBloc>()),
        BlocProvider(create: (_) => sl<CreateRequestBloc>()),
        BlocProvider(create: (_) => sl<PersonBloc>()),
        BlocProvider(create: (_) => sl<CreatePersonBloc>()),
      ],
      child: HomeScreenInit(),
    );
  }
}

class HomeScreenInit extends StatefulWidget {
  @override
  State<HomeScreenInit> createState() => _HomeScreenInitState();
}

class _HomeScreenInitState extends State<HomeScreenInit> {

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                const PersonScreen(),
                const RequestScreen(),
                ProfileScreen(),
              ],
            )
          ),
        ],
      ),

      bottomNavigationBar: _DeliveryNavigatorBar(
        index: _currentIndex,
        onIndexSelected: ( i ){
          setState(() {
            _currentIndex = i;
          });
        }
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: const Icon(Icons.add),
      // ),

    );

  }
}


class _DeliveryNavigatorBar extends StatelessWidget {

  final int index;
  final ValueChanged<int> onIndexSelected;

  const _DeliveryNavigatorBar({
    required this.index, 
    required this.onIndexSelected
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2,
            color: Theme.of(context).dividerColor
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              offset: Offset(1,1)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Tooltip(
                message: "Personas",
                child: Material(
                  child: IconButton(
                    icon: const Icon(Icons.people),
                    color: index == 0 ? SmartColors.green : SmartColors.lightGrey,
                    onPressed: () => onIndexSelected(0), 
                  ),
                ),
              ),

              Tooltip(
                message: "Solicitudes de Acceso",
                child: Material(
                  child: CircleAvatar(
                    backgroundColor: SmartColors.blue,
                    child: IconButton(
                    color: index == 1 ? SmartColors.green : SmartColors.white,
                      icon: const Icon(Icons.file_copy),
                      onPressed: () => onIndexSelected(1), 
                    ),
                  ),
                ),
              ),

              Tooltip(
                message: "Perfil",
                child: Material(
                  child: IconButton(
                  color: index == 2 ? SmartColors.green : SmartColors.lightGrey,
                    icon: const Icon(Icons.person_sharp),
                    onPressed: () => onIndexSelected(2), 
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}