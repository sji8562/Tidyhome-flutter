import 'package:flutter/material.dart';

import '../../../../_core/constants/color.dart';


class JoinRichTextItem extends StatelessWidget {
  const JoinRichTextItem({
    super.key,
    required this.text,
    this.strong,
  });

  final String text;
  final String? strong;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
              color: basicColorB3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: strong,
            style: TextStyle(color: accentColor),
          ),
        ],
      ),
    );
  }
}
