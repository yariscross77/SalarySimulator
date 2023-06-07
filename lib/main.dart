import 'package:flutter/material.dart';
import 'SimulatorPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SimulatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
