import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = "";
  String _lastName = "";
  DateTime _birthDate = DateTime.now();
  num _sex = 1;
  String _country = "";
  static const _birthDayStringBase = "Ingresa tu fecha de nacimiento";
  String _birthDayString = "Ingresa tu fecha de nacimiento";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Completa tu perfil"),
                const Icon(
                  Icons.account_circle,
                  size: 80.0,
                ),
                const Text(
                    "Sube una foto para poder identificarte más fácilmente"),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          _firstName = value;
                        },
                        decoration: const InputDecoration(
                          hintText: "Ingresa tus nombres",
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          _lastName = value;
                        },
                        decoration: const InputDecoration(
                          hintText: "Ingresa tus apellidos",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: GestureDetector(
                          onTap: () async {
                            final datePick = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (datePick != null && datePick != _birthDate) {
                              setState(() {
                                _birthDate = datePick;
                                _birthDayString =
                                    "${_birthDate.day.toString().padLeft(2, '0')}/${_birthDate.month.toString().padLeft(2, '0')}/${_birthDate.year}";
                              });
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _birthDayString,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: _birthDayString == _birthDayStringBase
                                      ? Colors.grey.shade600
                                      : Colors.black,
                                ),
                              ),
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        endIndent: 0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
