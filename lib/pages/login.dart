import 'package:flutter/material.dart';

const _appName = "FDA";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Divider(height: 25.0),
        Image(image: NetworkImage("https://i.stack.imgur.com/yZlqh.png")),

        // Bienvenido a XYZ
        Text(
          "Bienvenido a $_appName",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),

        // Inicie sesión o cree una cuenta

        // input mail

        // input passwd

        // forgot passwd? | Iniciar sesión

        // label: Inicie sesión con G+ facebook appel

        // link: continuar como invitado
      ],
    ));
  }
}
