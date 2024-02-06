import 'package:app_sol_y_cobre/src/widget/ficha.dart';
import 'package:flutter/material.dart';

class FichaScreen extends StatelessWidget {

  const FichaScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Image.asset(
          'images/logo1.png',
          width: 100,
          height: 100,
        ),
      ),
      body: const Ficha()
      );
  }
}