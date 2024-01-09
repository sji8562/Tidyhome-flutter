import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class CustomDividerThin extends StatelessWidget {
  const CustomDividerThin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(
        color: bgAndLineColor,
      ),
    );
  }
}
