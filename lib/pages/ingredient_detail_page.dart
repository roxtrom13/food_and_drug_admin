import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/widgets/common/app_bar.dart';

class IngredientDetailPage extends StatelessWidget {
  const IngredientDetailPage({
    Key? key,
  }) : super(key: key);

  Text _formatAlternativeNames(List<String> names) {
    var result = "";
    if (names.isEmpty) {
      result = "No se encontraron nombres alternativos";
    } else if (names.length == 1) {
      result = "También conocido como ${names[0]}";
    } else {
      result = "También conocido como ${names[0]}";
      for (var i = 1; i < names.length; i++) {
        result += " | ${names[i]}";
      }
    }
    return Text(
      result,
      style: TextStyle(color: Colors.teal.shade400),
    );
  }

  Text formatComsumptionDamage(double damage) {
    var text = "Sin determinar nivel";
    var textColor = Colors.grey.shade500;
    if (0.0 <= damage && damage <= 0.2) {
      text = "Muy bajo - nulo";
      textColor = Colors.blue.shade300;
    } else if (damage <= 0.4) {
      text = "Bajo";
      textColor = Colors.green.shade300;
    } else if (damage <= 0.6) {
      text = "Medio - moderado";
      textColor = Colors.yellow.shade800;
    } else if (damage <= 0.8) {
      text = "Alto";
      textColor = Colors.orange.shade700;
    } else if (damage <= 1.0) {
      text = "Muy alto";
      textColor = Colors.red.shade600;
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
    );
  }

  final items = [
    "Hepatitis",
    "Cáncer al páncreas",
    "Diarrea",
    "Dolor de cabeza",
    "Hepatitis",
    "Cáncer al páncreas",
    "Diarrea",
    "Dolor de cabeza",
    "Hepatitis",
    "Cáncer al páncreas",
    "Diarrea",
    "Dolor de cabeza",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genericAppBar(context, "Detalles de ingrediente"),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 140.0,
            width: double.infinity,
            child: const Text(
              "Ingredient image",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TITLE",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.bookmark),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    _formatAlternativeNames(["aa", "bb", "cc"]),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Descripción",
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text("A largo plazo puede causar"),
                Scrollbar(
                  child: Container(
                    height: 100.0,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: items.map((str) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '\u2022',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.55,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  str,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.6),
                                    height: 1.55,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14.0),
                const Text(
                  "Nivel de daño al consumo",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4.0),
                formatComsumptionDamage(0.5),
                const SizedBox(height: 6.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  height: 20.0,
                  child: LinearProgressIndicator(
                    color: Colors.grey.shade300,
                    backgroundColor: Colors.white,
                    value: 0.6,
                  ),
                ),
                const SizedBox(height: 18.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Aprobado por la fda"),
                    Text("Si"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  child: const Text(
                    "Link para más información",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
