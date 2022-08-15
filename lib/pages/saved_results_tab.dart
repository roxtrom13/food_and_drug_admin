import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/widgets/ingredient_list_card.dart';

class SavedResultsTab extends StatefulWidget {
  const SavedResultsTab({Key? key}) : super(key: key);

  @override
  State<SavedResultsTab> createState() => _SavedResultsTabState();
}

class _SavedResultsTabState extends State<SavedResultsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(height: 52.0),
                  Text(
                    "FDA App",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Resultados guardados",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text("Listas guardadas"),
            const SizedBox(height: 20.0),
            const Text("List array here"),
            const SizedBox(height: 20.0),
            const IngredientListCard(listTitle: "Lista 1"),
            const IngredientListCard(listTitle: "Lista 2"),
            const IngredientListCard(listTitle: "Lista 3"),
          ],
        ),
      ),
    );
  }
}
