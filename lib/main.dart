import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/pages/complete_profile.dart';
import 'package:food_and_drug_admin/pages/forgot_password.dart';
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
      initialRoute: "/complete-profile",
      routes: {
        "/": (context) => const Login(),
        "/register": (context) => const RegisterPage(),
        "/forgot-password": (context) => const ForgotPassword(),
        "/complete-profile": (context) => const CompleteProfile(),
      }
    );
  }
}
