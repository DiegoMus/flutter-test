import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //final myController = TextEditingController();

  bool _isHidden = true;
  bool _isHiddenC = true;
  //final myController1 = TextEditingController();
  //final myControllerDPI = TextEditingController();
  @override
  void _ojitoC() {
    setState(() {
      _isHiddenC = !_isHiddenC;
    });
  }

  @override
  Widget build(BuildContext context) {
    late TextEditingController nombresInputController =
        new TextEditingController();
    late TextEditingController apellidosInputController =
        new TextEditingController();
    late TextEditingController emailInputController =
        new TextEditingController();
    late TextEditingController pwdInputController = new TextEditingController();
    late TextEditingController confirmacionPwdInputController =
        new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: new ListView(
        children: [
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                new Center(
                  child: Icon(
                    Icons.person,
                    size: 150.0,
                  ),
                  //child: Image.asset("assets/images/person.png", height: 200.0),
                ),
                new TextFormField(
                  controller: emailInputController,
                  decoration: InputDecoration(
                      labelText: "Correo Electrónico",
                      hintText: "usuario@dominio.com"),
                  keyboardType: TextInputType.emailAddress,
                ),
                new SizedBox(
                  height: 15.0,
                ),
                new TextFormField(
                  controller: nombresInputController,
                  decoration: const InputDecoration(
                      labelText: "Nombre", hintText: "Nombre"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                new TextFormField(
                  controller: apellidosInputController,
                  decoration: new InputDecoration(
                      labelText: "Apellido", hintText: "Primer Apellido"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: pwdInputController,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    hintText: "*******",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: confirmacionPwdInputController,
                  decoration: InputDecoration(
                    labelText: "Confirma tu Contraseña",
                    hintText: "******",
                    suffix: InkWell(
                      onTap: _ojitoC,
                      child: Icon(
                        _isHiddenC ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: _isHiddenC,
                  keyboardType: TextInputType.text,
                  //
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    child: Text("Registrar"),
                    onPressed: () {
                      if (nombresInputController.text.isNotEmpty &&
                          apellidosInputController.text.isNotEmpty &&
                          emailInputController.text.isNotEmpty &&
                          pwdInputController.text.isNotEmpty &&
                          confirmacionPwdInputController.text.isNotEmpty) {
                        if (pwdInputController.text ==
                            confirmacionPwdInputController.text) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                              .then((currentUser) => FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(currentUser.user!.uid)
                                  .set({
                                    "uid": currentUser.user!.uid,
                                    "nombre": nombresInputController.text,
                                    "apellido": apellidosInputController.text,
                                    "email": emailInputController.text
                                  })
                                  .then((result) => {Navigator.pop(context)})
                                  .catchError((err) => print(err)))
                              .catchError((err) => print(err));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("Las contraseñas no coinciden"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("Cerrar"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Ingrese los datos necesarios para el registro")));
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
