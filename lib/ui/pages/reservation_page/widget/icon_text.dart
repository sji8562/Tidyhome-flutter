import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/style.dart';

class IconWithText extends StatelessWidget {
  final IconData icon_name;
  final String title;
  final acting;

  const IconWithText({super.key, required this.icon_name, required this.title, this.acting});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        children: [
          InkWell(
            onTap: acting,
            child: Row(
              children: [
                Icon(icon_name, size: 18),
                SizedBox(width: 10.0,),
                textBody6(title),
              ],
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
