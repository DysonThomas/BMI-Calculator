import 'package:flutter/material.dart';

class iconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  iconContent({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        SizedBox(
          height: 10,
        ),
        Text(label, style: TextStyle(fontSize: 20, color: Colors.white))
      ],
    );
  }
}
