import 'package:flutter/material.dart';
import 'package:itys_registro/src/pages/home_page.dart';
import 'package:itys_registro/src/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailInputController = new TextEditingController();
  late TextEditingController pwdInputController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inicio de Sesión"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child:
                          Image.asset("assets/images/itys.png", width: 350.0)),
                  SizedBox(height: 40.0),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "Correo Electrónico",
                        hintText: "usuario@dominio.com"),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailInputController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: "Contraseña",
                        hintText: "******"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: pwdInputController,
                  ),
                  SizedBox(height: 40.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      child: Text("Inciar Sesión"),
                      onPressed: () {
                        if (emailInputController.text.isNotEmpty &&
                            pwdInputController.text.isNotEmpty) {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                              .then((currentUser) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage())));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Complete los datos")));
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text("¿Todavia no tienes una cuenta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            //EMPUJAR Y REMPLAZAR
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text("registrate aqui"))
                ],
              ),
            ),
          ],
        ));
  }
}
