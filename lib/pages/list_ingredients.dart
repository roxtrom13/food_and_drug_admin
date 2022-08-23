import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/widgets/ingredient_card.dart';

class ListIngredientsPage extends StatefulWidget {
  const ListIngredientsPage({Key? key}) : super(key: key);

  @override
  State<ListIngredientsPage> createState() => _ListIngredientsPageState();
}

class _ListIngredientsPageState extends State<ListIngredientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Lista 1",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Resultados para la lista X",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 12.0),
            Wrap(
              runSpacing: 12.0,
              children: const [
                IngredientCard(
                  name: "Ingrediente 1",
                  description:
                      "Voluptatum sunt sunt omnis. Qui nemo tenetur et eos. Dicta atque aliquam non id.",
                  damage: 0.1,
                ),
                IngredientCard(
                  name: "Ingrediente 2",
                  description:
                      "Voluptatum sunt sunt omnis. Qui nemo tenetur et eos. Dicta atque aliquam non id.",
                  damage: 0.9,
                ),
                IngredientCard(
                  name: "Ingrediente 3",
                  description:
                      "Voluptatum sunt sunt omnis. Qui nemo tenetur et eos. Dicta atque aliquam non id.",
                  damage: 0.4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
