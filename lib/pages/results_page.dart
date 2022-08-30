import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/widgets/common/app_bar.dart';
import 'package:food_and_drug_admin/widgets/ingredient_card.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genericAppBar(context, "Resultados"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("FDA App"),
              Row(
                children: const [
                  Text("Guardar lista"),
                  Icon(
                    Icons.bookmark,
                    semanticLabel: "Guardar lista",
                  ),
                ],
              ),
            ],
          ),
          Text(
            "Resumen general del producto evaluado",
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 6.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Ver resumen general"),
          ),
          const SizedBox(height: 22.0),
          Text(
            "Resultados por ingrediente",
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 6.0),
          Wrap(
            runSpacing: 20.0,
            children: const [
              IngredientCard(
                name: "Resultado ga",
                description:
                    "Laboriosam qui provident nam et adipisci quibusdam. Velit dolorem expedita",
                damage: 0.3,
              ),
              IngredientCard(
                name: "Resultado ga",
                description:
                    "Laboriosam qui provident nam et adipisci quibusdam. Velit dolorem expedita",
                damage: 0.3,
              ),
              IngredientCard(
                name: "Resultado ga",
                description:
                    "Laboriosam qui provident nam et adipisci quibusdam. Velit dolorem expedita",
                damage: 0.3,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
