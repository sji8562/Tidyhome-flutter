import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class SoftColorButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const SoftColorButton({required this.text, this.funPageRoute});

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
          backgroundColor: primaryColor02,
        ),
        onPressed: funPageRoute,
        child: Text("$text", style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
