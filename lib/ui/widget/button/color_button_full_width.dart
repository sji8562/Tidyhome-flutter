import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class ColorButtonFullWith extends StatelessWidget {
  final String text;
  final action;

  const ColorButtonFullWith({required this.text, required this.action, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: primaryColor,
      ),
      onPressed: action ?? () {},
      child: Center(child: Text("$text", style: TextStyle(color: Colors.white, fontSize: 16),)),
    );
  }
}
