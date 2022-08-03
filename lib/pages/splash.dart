import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TWUIColors.orange.shade400,
        body: Center(
          child: Image.asset('assets/img/health.png', width: 120,),
        )
    );
  }
}
