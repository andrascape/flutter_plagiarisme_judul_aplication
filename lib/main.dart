import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plagiarisme_app/app/pages/homePage.dart';
import 'package:plagiarisme_app/app/view/loginView.dart';

void main(List<String> args) {
  runApp(
    PlagiarismeApp(),
  );
}

class PlagiarismeApp extends StatelessWidget {
  const PlagiarismeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPagee(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
