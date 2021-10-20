//androidx

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:itys_registro/src/pages/splash_page.dart';
//ios
//import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //quitar el banner de debug
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            inputDecorationTheme: InputDecorationTheme(
                fillColor: Color(0xFFECF1F7),
                isCollapsed: true,
                filled: true,
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide.none))),
        //home: MyHomePage(title: 'Primer cambio'),
        home: SplashPage());
  }
}
