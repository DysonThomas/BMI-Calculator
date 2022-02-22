import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.interpretation,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      // Color(0xFF24D876)
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Center(
          //   child: Text(
          //     'Result',
          //     style: TextStyle(
          //       color: Color(0xFF24D876),
          //       fontSize: 50.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Center(
            child: Text(
              bmiResult,
              style: TextStyle(
                color: Color(0xFF24D876),
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              resultText,
              style: TextStyle(
                color: Color(0xFF24D876),
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                interpretation,
                style: TextStyle(
                  color: Color(0xFF24D876),
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
