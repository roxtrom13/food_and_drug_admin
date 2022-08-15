import 'package:flutter/material.dart';

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
          children: const [
            Text("Hola mundo"),
            Text("Mundo hola"),
          ],
        ),
      ),
    );
  }
}
