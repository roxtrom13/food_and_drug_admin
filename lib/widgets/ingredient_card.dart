import 'package:flutter/material.dart';

class IngredientCard extends StatefulWidget {
  const IngredientCard({
    Key? key,
    required this.name,
    required this.description,
    required this.damage,
  }) : super(key: key);

  final String name;
  final String description;
  final double damage;

  @override
  State<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends State<IngredientCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 3.0,
          color: Colors.grey.shade400,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const Icon(Icons.bookmark),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.network(
                    "https://i.stack.imgur.com/yZlqh.png",
                    height: 80.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        widget.description,
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text("Nivel de daño al consumo"),
                    const SizedBox(height: 4.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      height: 20.0,
                      width: 200.0,
                      child: LinearProgressIndicator(
                        color: Colors.grey.shade300,
                        backgroundColor: Colors.white,
                        value: widget.damage,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
