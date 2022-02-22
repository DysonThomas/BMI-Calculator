import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiResult});
  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      // Color(0xFF24D876)
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Result',
              style: TextStyle(
                color: Color(0xFF24D876),
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              bmiResult,
              style: TextStyle(
                color: Colors.green,
                fontSize: 40.0,
              ),
            ),
          ),
          Center(
            child: Text(
              'Normal',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
