import 'package:flutter/material.dart';
import 'inputscreen.dart';
import 'result.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF0A0E21)),
      // theme: ThemeData(scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: InputPage(),
    );
  }
}
