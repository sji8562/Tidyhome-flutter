import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class ExclamationmarkTitle extends StatelessWidget {
  final String title;

  const ExclamationmarkTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        children: [
          Icon(CupertinoIcons.exclamationmark_circle_fill, size: 14, color: primaryColor,),
          SizedBox(width: 10.0,),
          Text(title),
        ],
      ),
    );
  }
}
