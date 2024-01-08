import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class ColorButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const ColorButton({required this.text, required this.funPageRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(345, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: funPageRoute ?? () {},
        child: Text("$text", style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
    );
  }
}
