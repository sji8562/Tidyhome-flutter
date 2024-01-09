import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class BlueSmalltextButton extends StatelessWidget {
  final String text;
  final action;

  const BlueSmalltextButton({super.key, required this.text, this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 5.0),
      child: Container(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: action != null ? action : () {},
            child: Text(text, style: TextStyle(fontSize: 13.0,
                color: primaryColor,
                fontWeight: FontWeight.bold),),
          )),
    );
  }
}
