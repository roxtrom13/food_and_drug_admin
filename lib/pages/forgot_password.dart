import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";

  void sendRestoreEmail() {
    if (kDebugMode) {
      print(_email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("¿Olvidaste tu contraseña?"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Ingresa el correo electrónico asociado a la cuenta y te enviaremos un código de verificación",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                onChanged: (value) {
                  _email = value;
                },
                decoration: const InputDecoration(
                  hintText: "Ingresa tu correo electrónico",
                ),
                validator: (value) {
                  if (value!.contains(RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                    return "Ingrese un correo válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 35.0),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    fixedSize: const Size(0, 50),
                  ),
                  child: const Text("Enviar link"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
