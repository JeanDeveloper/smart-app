import 'package:flutter/material.dart';
import 'package:smart/presentation/screens/login/login_screen.dart';
import 'package:smart/presentation/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Mi Perfil"),
        centerTitle: true,
        elevation: 0.5,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: SmartColors.green
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      foregroundImage: NetworkImage('https://images.unsplash.com/photo-1611213574794-5e2ea4d6c339?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                      radius: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text("Jean Carlo Chunga Sandoval", style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor), )
              ],
            )
          ),

          Expanded( 
            flex: 2, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Card(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text("Informacion Personal", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize:  13, color: Theme.of(context).disabledColor)),
                          const SizedBox(height: 25,),
                          const Text("Correo Electronico"),
                          Text("jean@jean.com", style: TextStyle(color: Theme.of(context).disabledColor, fontSize: 12 )),

                          Row(  
                            children: [
                              const Text("Modo Oscuro"),
                              const Spacer(),
                              Switch(value: true, onChanged:(value) {})
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 80)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      backgroundColor: const MaterialStatePropertyAll(SmartColors.blue)
                    ) ,
                    onPressed: (){
                      Navigator.of(context).pushReplacement( 
                        MaterialPageRoute(
                          builder: ( _ ) => const LoginScreen(), 
                        )
                      );
                    }, 
                    child: const Text('Cerrar Sesion')
                  ),
                ),

              ],
            ) 
          ),

        ],
      ),

    );
  }
}