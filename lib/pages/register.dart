import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool _showPassword1 = false;
  bool _showPassword2 = false;
  String _email = "";
  String _password1 = "";
  String _password2 = "";

  void performRegister(ctx) {
    if (kDebugMode) {
      print("email: $_email, password1: $_password1, password2: $_password2");
    }
    Navigator.pushNamed(ctx, "/auth/complete-profile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Registro"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Registrarse",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    const SizedBox(height: 10.0),
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
                        _password1 = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Ingresa tu contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword1 = !_showPassword1;
                            });
                          },
                          child: Icon(_showPassword1
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: !_showPassword1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo es requerido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _password2 = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Confirma tu contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword2 = !_showPassword2;
                            });
                          },
                          child: Icon(_showPassword2
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      obscureText: !_showPassword2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo es requerido";
                        }
                        if (_password1 != _password2) {
                          return "Las contraseñas no coinciden";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25.0),
                    Center(
                      child: Text(
                        "Regístrate con",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 90.0),
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
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            performRegister(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          fixedSize: const Size(240, 50),
                        ),
                        child: const Text("Crear cuenta"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
