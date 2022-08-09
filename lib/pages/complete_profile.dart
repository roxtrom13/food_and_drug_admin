import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

import '../assets/constants.dart' as constants;

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
  String _country = "";
  constants.Gender? _gender = constants.Gender.female;

  static const _birthDayStringBase = "Ingresa tu fecha de nacimiento";
  String _birthDayString = "Ingresa tu fecha de nacimiento";
  static const _selectCountryStringBase = "País";
  String _selectCountryString = "País";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Completa tu perfil",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Icon(
                  Icons.account_circle,
                  size: 80.0,
                ),
                const SizedBox(height: 20.0),
                const Text(
                    "Sube una foto para poder identificarte más fácilmente"),
                const SizedBox(height: 20.0),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Este campo es requerido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        onChanged: (value) {
                          _lastName = value;
                        },
                        decoration: const InputDecoration(
                          hintText: "Ingresa tus apellidos",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Este campo es requerido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
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
                                  fontSize: 15.9,
                                  fontWeight: FontWeight.w400,
                                  color: _birthDayString == _birthDayStringBase
                                      ? Colors.grey.shade700
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
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 98,
                            child: RadioListTile(
                              visualDensity: VisualDensity.compact,
                              title: const Text("Mujer"),
                              contentPadding: const EdgeInsets.all(0),
                              value: constants.Gender.female,
                              groupValue: _gender,
                              onChanged: (constants.Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 98,
                            child: RadioListTile(
                              visualDensity: VisualDensity.compact,
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text("Varón"),
                              value: constants.Gender.male,
                              groupValue: _gender,
                              onChanged: (constants.Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 98,
                            child: RadioListTile(
                              visualDensity: VisualDensity.compact,
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text("Otro"),
                              value: constants.Gender.other,
                              groupValue: _gender,
                              onChanged: (constants.Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              favorite: ['PE'],
                              onSelect: (Country country) {
                                setState(() {
                                  _country = country.name;
                                  _selectCountryString = country.name;
                                });
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _selectCountryString,
                                style: TextStyle(
                                  fontSize: 15.9,
                                  fontWeight: FontWeight.w400,
                                  color: _selectCountryString ==
                                          _selectCountryStringBase
                                      ? Colors.grey.shade700
                                      : Colors.black,
                                ),
                              ),
                              const Icon(
                                Icons.search,
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
                      const SizedBox(height: 20.0),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // save user data
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            fixedSize: const Size(0, 50),
                          ),
                          child: const Text("Completar perfil"),
                        ),
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
