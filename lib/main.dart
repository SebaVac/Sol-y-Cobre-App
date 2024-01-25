import 'package:app_sol_y_cobre/src/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transportes Sol y Cobre',
      home: HomeScreen(),
    );
  }
}