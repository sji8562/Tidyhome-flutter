import 'package:flutter/material.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/move.dart';

class CheckedTap extends StatelessWidget {
  final String text;
  final String moveRoute;
  CheckedTap({required this.text, required this.moveRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.5,horizontal: 25),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Container(child: Row(children: [Icon(Icons.check, color: primaryColor
          ),SizedBox(width: 10,),
            Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
          ],),),
          Container(child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, moveRoute);
              },
              child: Icon(Icons.arrow_forward_ios_sharp, color: basicColorB7, size: 15,)))
        ],
      ),
    );
  }
}
