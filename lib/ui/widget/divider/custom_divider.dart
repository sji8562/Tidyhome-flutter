import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 28, thickness: 8, color: bgAndLineColor);
  }
}
