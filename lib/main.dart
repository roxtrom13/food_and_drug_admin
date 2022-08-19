import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_and_drug_admin/pages/complete_profile.dart';
import 'package:food_and_drug_admin/pages/forgot_password.dart';
import 'package:food_and_drug_admin/pages/login.dart';
import 'package:food_and_drug_admin/pages/register.dart';
import 'package:food_and_drug_admin/pages/home.dart';
import 'package:food_and_drug_admin/pages/update_profile.dart';

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
      supportedLocales: const [
        Locale("es"),
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xfffb923c),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) => const Login(),
        "/auth/register": (context) => const RegisterPage(),
        "/auth/forgot-password": (context) => const ForgotPassword(),
        "/auth/complete-profile": (context) => const CompleteProfile(),
        "/update-profile": (context) => const UpdateProfilePage(),
      },
    );
  }
}
