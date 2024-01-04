import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class ColorButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const ColorButton({required this.text, this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: funPageRoute,
        child: Text("$text", style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
    );
  }
}
