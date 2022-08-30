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
    return Text(result);
  }

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
                  children: const [Text("TITLE"), Icon(Icons.bookmark)],
                ),
                Row(
                  children: [
                    _formatAlternativeNames(["aa", "bb", "cc"]),
                  ],
                ),
                const Text(
                  "Descripción",
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
                ),
                const Text("A largo plazo puede causar"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
