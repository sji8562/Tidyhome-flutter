import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class CustomDividerThin extends StatelessWidget {
  final double horizontal;

  const CustomDividerThin({super.key, this.horizontal = 20.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Divider(
        color: bgAndLineColor,
      ),
    );
  }
}
