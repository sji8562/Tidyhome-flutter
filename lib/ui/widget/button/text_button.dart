import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';

class FlatButton extends StatelessWidget {
  final String text;
  final moveRoute;
  final EdgeInsets? contentPadding;


  FlatButton({required this.text, this.moveRoute, this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: moveRoute,
      style: TextButton.styleFrom(
        padding: contentPadding, // contentPadding을 여기서 적용
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: primaryColor,
        ),
      ),
    );
  }
}
