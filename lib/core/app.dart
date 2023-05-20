import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/general_document/general_document_contractor_bloc.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/person_document/person_document_cont_bloc.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/core/injections/auth_injection.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/profile/profile_bloc.dart';
import 'package:smart/presentation/screens/splash/splash_screen.dart';
import 'package:smart/presentation/blocs/admin/authority/authority_bloc.dart';
import 'package:smart/presentation/blocs/admin/person/general_person_doc/general_person_doc_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/general_document/general_document_bloc.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_document/person_document_request_bloc.dart';

class Smart extends StatelessWidget {

  const Smart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<ProfileBloc>()),
        BlocProvider(create: (_) => sl<GeneralPersonDocBloc>()),
        BlocProvider(create: (_) => sl<PersonDocumentRequestBloc>()),
        BlocProvider(create: (_) => sl<PersonDocumentContBloc>()),
        BlocProvider(create: (_) => sl<GeneralDocumentBloc>()),
        BlocProvider(create: (_) => sl<GeneralDocumentBloc>()),
        BlocProvider(create: (_) => sl<GeneralDocumentContractorBloc>()),
        BlocProvider(create: (_) => sl<AuthorityBloc>()),
      ],
      child: const SmartApp(),
    );
  }

}

class SmartApp extends StatelessWidget {

  const SmartApp({super.key});

  @override
  Widget build(BuildContext context) {

    final _borderLight = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: SmartColors.lightGrey, 
        width: 2, 
        style: BorderStyle.solid
      )
    );

    final _borderDark = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: SmartColors.grey,
        // width: 2,
        style: BorderStyle.solid
      )
    );

    final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: SmartColors.white,
        iconTheme: const IconThemeData(color: SmartColors.blue),
        titleTextStyle: GoogleFonts.poppins().copyWith(
          color: SmartColors.blue,
          fontWeight: FontWeight.bold,
        )
      ),
      canvasColor: SmartColors.white,
      disabledColor: SmartColors.grey,
      accentColor: SmartColors.blue,
      dividerColor: SmartColors.veryLightGrey,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: SmartColors.blue,
        displayColor: SmartColors.blue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        border: _borderLight,
        enabledBorder: _borderLight,
        focusedBorder: _borderLight,
        labelStyle: const TextStyle(color: SmartColors.blue, fontSize: 13),
        hintStyle: GoogleFonts.poppins(color: SmartColors.lightBlue, fontSize: 14),
      ),
      iconTheme: const IconThemeData(
        color: SmartColors.blue,
      ),
    );

    final darkTheme = ThemeData(
      hintColor: SmartColors.white,
      appBarTheme: AppBarTheme(
        color: SmartColors.blue,
        titleTextStyle: GoogleFonts.poppins().copyWith(
          color: SmartColors.white,
          fontWeight: FontWeight.bold
        )
      ),
      dividerColor: Colors.transparent,
      accentColor: SmartColors.white,
      canvasColor: SmartColors.grey,
      disabledColor: SmartColors.white,
      scaffoldBackgroundColor: SmartColors.dark,
      textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: SmartColors.green, displayColor: SmartColors.green),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: SmartColors.grey,
        border: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        labelStyle: const TextStyle(color: SmartColors.white, fontSize: 13),
        hintStyle: GoogleFonts.poppins(color: SmartColors.white, fontSize: 14),
      ),
      iconTheme: const IconThemeData(
        color: SmartColors.white,
      ),
    );

    return BlocBuilder<ProfileBloc, ProfileState>(

      builder: (context, state) {

        if( state is DarkMode ) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Smart App',
            theme: darkTheme,
            home: const SplashScreen(),
          );
        }

        if( state is StoredMode ){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Smart App',
            theme: (state.isDark) ? darkTheme  : lightTheme,
            home: const SplashScreen(),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart App',
          theme:  lightTheme,
          home: const SplashScreen(),
        );

      },
    );
  }
}