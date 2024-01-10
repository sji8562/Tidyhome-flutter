import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class ColorButtonNoPadding extends StatelessWidget {
  final String text;
  final funPageRoute;

  const ColorButtonNoPadding({required this.text, required this.funPageRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(380, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: primaryColor,
      ),
      onPressed: funPageRoute ?? () {},
      child: Text("$text", style: TextStyle(color: Colors.white, fontSize: 14),),
    );
  }
}
