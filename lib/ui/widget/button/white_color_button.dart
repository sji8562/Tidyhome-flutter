import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class WhiteColorButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const WhiteColorButton({required this.text, this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(345, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: basicColorW,
        ),
        onPressed: funPageRoute,
        child: Text("$text", style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
