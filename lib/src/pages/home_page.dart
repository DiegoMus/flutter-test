import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:itys_registro/src/pages/login_pager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((result) =>
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage())));
            },
          )
        ],
      ),
      body: Center(child: Text("Hola, Bievenido!")),
    );
  }
}
