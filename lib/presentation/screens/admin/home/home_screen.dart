import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/presentation/blocs/admin/request/request_bloc.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/presentation/screens/screens.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/presentation/blocs/admin/contractor/contractor_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<RequestBloc>()),
        BlocProvider(create: (_) => sl<ContractorBloc>()),
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
                const ContractorsScreen(),
                const RequestScreen(),
                ProfileScreen(),
              ],
            )
          ),

          _DeliveryNavigatorBar(
            index: _currentIndex,
            onIndexSelected: ( i ){
              setState(() {
                _currentIndex = i;
              });
            }
          ),

        ],
      )
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
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.grey,
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
                message: "Autorizacion de Credenciales",
                child: Material(
                  child: IconButton(
                    icon: const Icon(Icons.lock_person_rounded),
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
                    icon: const Icon(Icons.person),
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