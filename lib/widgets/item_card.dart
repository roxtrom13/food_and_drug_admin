import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({ super.key, required this.title, required this.description, required this.icon });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.fromLTRB(12.0, 24.0, 2.0, 24.0),
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
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(icon, size: 32.0,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.5,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 260.0,
                  child: Text(
                    description,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.grey.shade500,
                    ),
                    maxLines: 3,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
