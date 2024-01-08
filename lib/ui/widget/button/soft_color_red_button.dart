import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class SoftColorRedButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const SoftColorRedButton({required this.text, this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(500, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: softRedColor,
        ),
        onPressed: funPageRoute,
        child: Text("$text", style: TextStyle(color: accentColor, fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
