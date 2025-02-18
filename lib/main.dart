import 'package:flutter/material.dart';
import 'package:space_explorer/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.deepPurpleAccent,
      ),
      home: HomeScreen(),
    );
  }
}
