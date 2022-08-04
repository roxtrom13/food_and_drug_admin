import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final String _appName = "FDA";
  bool _showPassword = true;
  void _togglePassword() {
    _showPassword = !_showPassword;
    print(_showPassword);
  }

  void _goToRegister() {
    print("route to register page!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 50.0),
            const FittedBox(
              fit: BoxFit.fill,
              child: Image(
                image: NetworkImage("https://i.stack.imgur.com/yZlqh.png"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Bienvenido a $_appName",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),

                    // Inicie sesión o cree una cuenta
                    Row(
                      children: [
                        const Text("Inicia sesión o"),
                        TextButton(
                          onPressed: _goToRegister,
                          child: const Text(
                            "cree una cuenta",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Correo electrónico"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _togglePassword();
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
                          return "Please enter some text";
                        }
                        return null;
                      },
                    ),

                    Text(_showPassword.toString()),

                    // input mail

                    // input passwd

                    // forgot passwd? | Iniciar sesión

                    // label: Inicie sesión con G+ facebook appel

                    // link: continuar como invitado
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
