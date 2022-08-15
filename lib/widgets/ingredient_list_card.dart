import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IngredientListCard extends StatelessWidget {
  const IngredientListCard({
    Key? key,
    this.imageUrl,
    required this.listTitle,
  }) : super(key: key);

  final String? imageUrl;
  final String listTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print("generic action");
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 2.0, 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 3.0,
            color: Colors.black87,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.black87,
                ),
              ),
              child: const Image(
                image: NetworkImage("https://i.stack.imgur.com/yZlqh.png"),
                width: 60.0,
              ),
            ),
            Text(listTitle),
          ],
        ),
      ),
    );
  }
}
