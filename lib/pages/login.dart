import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final String _appName = "FDA";

  bool _showPassword = false;
  String _email = "";
  String _password = "";

  void _performLogin() {
    if (kDebugMode) {
      print("email: $_email, password: $_password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
          children: [
            const FittedBox(
              fit: BoxFit.fill,
              child: Image(
                image: NetworkImage("https://i.stack.imgur.com/yZlqh.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Te damos la bienvenida a $_appName",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    Row(
                      children: [
                        const Text("Inicia sesión o"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/auth/register");
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                            textStyle: const TextStyle(
                                decoration: TextDecoration.underline),
                          ),
                          child: const Text("cree una cuenta"),
                        )
                      ],
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _email = value;
                      },
                      decoration:
                          const InputDecoration(hintText: "Correo electrónico"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Este campo es requerido";
                        }
                        if (!value.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                          return "Debe usar un correo válido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(_showPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: !_showPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo es requerido";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, "/auth/forgot-password");
                          },
                          child: const Text("¿Olvidaste tu contraseña?"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _performLogin();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            fixedSize: const Size(140, 10),
                          ),
                          child: const Text("Iniciar sesión"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Center(
                      child: Text(
                        "Inicie sesión con",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 90.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          FaIcon(FontAwesomeIcons.googlePlus),
                          FaIcon(FontAwesomeIcons.facebookSquare),
                          FaIcon(FontAwesomeIcons.apple),
                        ],
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/");
                        },
                        child: const Text(
                          "Continuar como invitado",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
