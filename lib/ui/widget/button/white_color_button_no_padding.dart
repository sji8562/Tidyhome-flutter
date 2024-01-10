import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class WhiteColorButtonNoPadding extends StatelessWidget {
  final String text;
  final funPageRoute;

  const WhiteColorButtonNoPadding({required this.text, this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(380, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: basicColorW,
      ),
      onPressed: funPageRoute,
      child: Text("$text", style: TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.bold),),
    );
  }
}
