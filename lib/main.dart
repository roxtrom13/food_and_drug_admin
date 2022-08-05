import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/pages/login.dart';
import 'package:food_and_drug_admin/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food and Drug Administrator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xfffb923c),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Login(),
        "/register": (context) => const RegisterPage(),
      }
    );
  }
}
