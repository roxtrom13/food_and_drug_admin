import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/widgets/ingredient_card.dart';

class SearchIngredientsTab extends StatefulWidget {
  const SearchIngredientsTab({Key? key}) : super(key: key);

  @override
  State<SearchIngredientsTab> createState() => _SearchIngredientsTabState();
}

class _SearchIngredientsTabState extends State<SearchIngredientsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                color: Colors.blue,
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Resultados para \$nombre"),
                    const SizedBox(height: 20.0),
                    Wrap(
                      runSpacing: 12.0,
                      children: const [
                        IngredientCard(
                          name: "Ingrediente 1",
                          description:
                              "tnahoe ustnaohe utnhaosnetuhao ntehusn taoheu ntaohe usntoheut s",
                          damage: 0.2,
                        ),
                        IngredientCard(
                          name: "Ingrediente 2",
                          description:
                              "tnahoe ustnaohe utnhaosnetuhao ntehusn taoheu ntaohe usntoheut s",
                          damage: 0.2,
                        ),
                        IngredientCard(
                          name: "Ingrediente 3",
                          description:
                              "tnahoe ustnaohe utnhaosnetuhao ntehusn taoheu ntaohe usntoheut s",
                          damage: 0.8,
                        ),
                        IngredientCard(
                          name: "Ingrediente 4",
                          description:
                              "tnahoe ustnaohe utnhaosnetuhao ntehusn taoheu ntaohe usntoheut s",
                          damage: 0.2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SearchWidget(),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 174,
      right: 30,
      left: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              splashColor: Colors.grey,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            const Expanded(
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Buscar ingredientes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
