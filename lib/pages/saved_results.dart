import 'package:flutter/material.dart';

class SavedResultsPage extends StatefulWidget {
  const SavedResultsPage({Key? key}) : super(key: key);

  @override
  State<SavedResultsPage> createState() => _SavedResultsPageState();
}

class _SavedResultsPageState extends State<SavedResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            Text("Hola mundo"),
            Text("Mundo hola"),
          ],
        ),
      ),
    );
  }
}
