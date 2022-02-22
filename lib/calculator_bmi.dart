import 'dart:math';

class calculator_bmi {
  calculator_bmi({required this.height, required this.weight});

  final int height;
  final int weight;

  String calculateBmi() {
    double bmi = weight / pow((height / 100), 2);
    return bmi.toStringAsFixed(1);
  }
}
