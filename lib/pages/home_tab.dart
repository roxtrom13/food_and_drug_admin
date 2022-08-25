import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/widgets/item_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  void _customHandler(String cardName) {
    if (kDebugMode) {
      print("Hello from custom handler $cardName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.account_circle, size: 52.0),
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
          "Buenos días, TheRoier :)",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 40.0),
        ItemCard(
          title: "Buscar ingredientes",
          description: "Buscar los ingredientes por nombre snaothe nstuhaonstehunaothenstuhaonet hnsaoth ntontehunto hentuh nsaotehuntaohensuth nsoteuhns tahoenstuhnaothnsutoehu",
          icon: Icons.search,
          cardHandler: _customHandler,
        ),
        ItemCard(
          title: "Consultar por imagen",
          description: "Consulta los ingredientes por imágenes",
          icon: Icons.photo_camera,
          cardHandler: _customHandler,
        ),
        ItemCard(
          title: "Resultados guardados",
          description: "Consulta ingredientes guardados",
          icon: Icons.list,
          cardHandler: _customHandler,
        ),
        ItemCard(
          title: "Historial de búsqueda",
          description: "Consulta su historial",
          icon: Icons.calendar_month,
          cardHandler: _customHandler,
        ),
      ],
    );
  }
}
