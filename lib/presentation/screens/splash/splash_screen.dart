// import 'package:delivery/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/presentation/screens/screens.dart';
import 'package:smart/presentation/theme/theme.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  // const SplashScreen._();

  // static Widget init( BuildContext context ){
  //   return ChangeNotifierProvider(
  //     create: (_) => SplashBloc(
  //       localRepository: context.read<ILocalRepository>(),
  //       apiRepository: context.read<IApiRepository>(),
  //     ),
  //     builder: ( _ , __ ) => const SplashScreen._(),
  //   );
  // }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback( ( _ ) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( _ ) => const LoginScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: SmartColors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: size.aspectRatio * 100,
              child: Padding(
                padding: const EdgeInsets.all( 8.0 ),
                child: SvgPicture.asset("assets/svg/logo-smart1.svg"),
              ) ,
            ),
            SizedBox( height: size.height * .05 ),
            Text(
              "Smart", 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: SmartColors.white,
              )
            )
          ],
        ),
      ),
    );
  }

}