import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SuscriptionCard extends StatelessWidget {
  const SuscriptionCard({
    Key? key,
    required this.name,
    required this.expiryDate,
    required this.amount,
  }) : super(key: key);

  final String name;
  final String expiryDate;
  final double amount;

  //TODO: config a custom dialog for iOS devices
  void _showCancelDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            "¿Seguro que desea cancelar su suscripción?",
            textAlign: TextAlign.center,
          ),
          titlePadding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 0.0),
          contentPadding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 64.0),
          children: [
            MaterialButton(
              onPressed: () {
                if (kDebugMode) {
                  print("Do the cancel stuff");
                }
              },
              color: Colors.purple.shade900,
              child: const Text(
                "Cancelar suscripción",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.grey.shade300,
              child: const Text(
                "Atrás",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey.shade200,
      ),
      margin: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fecha de renovación",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                expiryDate,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "\$$amount mensual",
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showCancelDialog(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade400,
                    fixedSize: const Size(110.0, 10.0)),
                child: const Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade900,
                    fixedSize: const Size(110.0, 10.0)),
                child: const Text("Renovar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
