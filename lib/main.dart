import 'package:flutter/material.dart';
import 'inputscreen.dart';
import 'result.dart';
import 'calculator_bmi.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  calculator_bmi calc = calculator_bmi(height: 180, weight: 90);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF0A0E21)),
      // theme: ThemeData(scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: InputPage(),
      routes: {
        '/result': (context) => ResultPage(
              bmiResult: calc.calculateBmi(),
            ),
      },
    );
  }
}
