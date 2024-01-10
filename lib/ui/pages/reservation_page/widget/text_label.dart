import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class TextLabel extends StatelessWidget {
  final String text;
  final is_active;

  const TextLabel({super.key, required this.text, this.is_active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        // TODO 여기 부분 상태에 따라 text 및 style 변해야 할듯
        child: Text(text, style: TextStyle(color: is_active ? primaryColor : disableColor, fontSize: 12),),
      ),
      color: bgAndLineColor,
    );
  }
}
