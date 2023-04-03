import 'package:flutter/material.dart';
import 'package:smart/presentation/screens/screens.dart';
import 'package:smart/presentation/theme/theme.dart';


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
              children: const [
                CredentialsScreen(),
                RequestScreen(),
                ProfileScreen(),
              ],
            )
          ),

          _DeliveryNavigatorBar(
            index: _currentIndex,
            onIndexSelected: (index){
              setState(() {
                _currentIndex = index;
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

  const _DeliveryNavigatorBar({super.key, required this.index, required this.onIndexSelected});

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
          )
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
                    icon: const Icon(Icons.lock_person_outlined),
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
                      icon: const Icon(Icons.file_copy_outlined),
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
                    icon: const Icon(Icons.person_outline_outlined),
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