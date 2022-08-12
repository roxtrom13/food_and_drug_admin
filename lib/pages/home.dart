import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _customHandler(String cardName) {
    if (kDebugMode) {
      print("Hello from custom handler $cardName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        iconSize: 27.0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade700,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera), label: "Cámara"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Listado"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Mi cuenta"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
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
                    "Mi usuario",
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
              "Buenos días, ThuXikitoRoier+nah",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40.0),
            ItemCard(
              title: "Buscar ingredientes",
              description: "Buscar los ingredientes por nombre",
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
        ),
      ),
    );
  }
}
