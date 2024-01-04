import 'package:flutter/material.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/move.dart';

class CheckedTapNoArrow extends StatelessWidget {
  final String text;
  final String moveRoute;
  CheckedTapNoArrow({required this.text, required this.moveRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.5,horizontal: 25),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Container(child: Row(children: [Icon(Icons.check, color: primaryColor
          ),SizedBox(width: 10,),
            Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
          ],),),
        ],
      ),
    );
  }
}
