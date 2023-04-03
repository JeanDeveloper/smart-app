import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/presentation/screens/screens.dart';
import 'package:smart/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(

        children: [

          //CABECERA
          Expanded(
            flex: 2,
            child: Stack(
              children: [

                Positioned(
                  bottom: 50,
                  left: -25,
                  right: -25,
                  height: size.width  + 25,
                  child: Container(
                    decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(200)
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff294466),
                          Color(0xff294466)
                        ],
                        stops: [
                          0.5,
                          1.0
                        ]
                      ),
                    ),
                  )
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).canvasColor,
                    radius: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        "assets/svg/logo-smart1.svg",
                      ),
                    ) ,
                  )
                )

              ],
            )

          ),

          //FORM
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(height: size.height * .05),
                    Text(
                      "Iniciar Sesion",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: size.height * .05),
                    Text(
                      textAlign: TextAlign.start,
                      "Usuario",
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    SizedBox(height: size.height * .01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 14),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          hintText: "Usuario"
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .05),
                    Text(
                      "Contraseña",
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: size.height * .01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 14),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          hintText: "Contraseña"
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
      
          ),

          //RECUPERAR CONTRASEÑA
          const Expanded(
            flex: 1,
            child: Text("Olvide mi contraseña"),
          ),

          Expanded(
          //BUTTON
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: DeliveryButton(
                padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
                text: "Ingresar",
                ontap: (){
                  Navigator.of(context).pushReplacement( MaterialPageRoute(
                      builder: ( _ ) => HomeScreen(), 
                  ));
                },
              )
            ),
          ),

        ],
      ),
    );
  }
}