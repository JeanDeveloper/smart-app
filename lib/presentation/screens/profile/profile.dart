import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/user.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/screens/login/login_screen.dart';
import 'package:smart/presentation/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Perfil"),
        centerTitle: true,
        elevation: .5,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if( state is AuthLogout ){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
              children: [
                const SizedBox(height: 30),

                Container(
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle, 
                    color: Theme.of(context).accentColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/png/avatar_no_found.png'),
                      radius: 50,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoged) {
                      final User user = state.user;
                      return Text(
                        StringUtils.converString('${user.nombres} ${user.apellidos}'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor
                        ),
                      );
                    }

                    return SizedBox(
                      width: 20.0,
                      height: 10.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: const Text(
                          "Nombre",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );

                  },
                )
              ],
            )),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Card(
                      color: Theme.of(context).canvasColor,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Informacion Personal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Theme.of(context).disabledColor)),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text("Correo Electronico"),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                if (state is AuthLoged) {
                                  final User user = state.user;
                                  return Text(user.email,
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontSize: 12));
                                }
                                return SizedBox(
                                  width: 20.0,
                                  height: 10.0,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: const Text(
                                      "Correo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: size.height * .01,),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("DNI"),
                                    BlocBuilder<AuthBloc, AuthState>(
                                      builder: (context, state) {
                                        if (state is AuthLoged) {
                                          final User user = state.user;
                                          return Text(
                                            user.nroDoc,
                                            style: TextStyle(color:Theme.of(context).disabledColor,fontSize: 12)
                                          );
                                        }
                                        return SizedBox(
                                          width: 20.0,
                                          height: 10.0,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.red,
                                            highlightColor: Colors.yellow,
                                            child: const Text(
                                              "DNI",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Telefono"),
                                    BlocBuilder<AuthBloc, AuthState>(
                                      builder: (context, state) {
                                        if (state is AuthLoged) {
                                          final User user = state.user;
                                          return Text(
                                            user.telefono,
                                            style: TextStyle(color:Theme.of(context).disabledColor,fontSize: 12)
                                          );
                                        }
                                        return SizedBox(
                                          width: 20.0,
                                          height: 10.0,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.red,
                                            highlightColor: Colors.yellow,
                                            child: const Text(
                                              "DNI",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                )





                              ],
                            )


                            // Row(
                            //   children: [
                            //     const Text("Modo Oscuro"),
                            //     const Spacer(),
                            //     BlocBuilder<ProfileBloc, ProfileState>(
                            //       builder: (context, state) {
                            //         bool isDark = state.isDark;
                            //         return Switch(
                            //           activeColor: SmartColors.purple,
                            //           value: isDark,
                            //           onChanged: (value) => BlocProvider.of<ProfileBloc>(context).add(ChangeMode(!isDark))
                            //         );
                            //       },
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(

                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll( EdgeInsets.symmetric(horizontal: 80)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        backgroundColor: const MaterialStatePropertyAll(SmartColors.blue)
                      ),

                      onPressed: () => BlocProvider.of<AuthBloc>(context).add(DoLogoutEvent()),
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {

                          if(state is AuthLoading){
                            return const SizedBox( width: 20, height: 20, child: CircularProgressIndicator());
                          }

                          return const Text("Cerrar Sesion");
                        },
                      )
                    ),
                  ),

                  SizedBox(height: size.height * .05),

                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
