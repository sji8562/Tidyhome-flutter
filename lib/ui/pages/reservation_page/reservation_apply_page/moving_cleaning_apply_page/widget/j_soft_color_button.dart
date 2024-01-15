import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';


class JSoftColorButton extends StatelessWidget {
  final String text;
  final customColor;
  final funPageRoute;

  const JSoftColorButton({required this.text, this.funPageRoute, this.customColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(360, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: customColor,
        ),
        onPressed: funPageRoute,
        child: Text("$text", style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
