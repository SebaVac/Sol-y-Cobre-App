import 'package:app_sol_y_cobre/src/widget/encuesta.dart';
import 'package:flutter/material.dart';

class EncuestaScreen extends StatelessWidget {
  const EncuestaScreen({super.key});

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
      body: const Encuesta()
      );
  }
}