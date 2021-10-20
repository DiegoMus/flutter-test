import 'dart:async';

import 'package:flutter/material.dart';
import 'package:itys_registro/src/pages/login_pager.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
          //EMPUJAR Y REMPLAZAR
          context,
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //color: Colors.blue,
          child: Center(
        child: Image.asset("assets/images/itys.png"),
      )),
    );
  }
}
