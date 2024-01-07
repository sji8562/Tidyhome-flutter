import 'package:flutter/material.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/define.dart';

class TitleOnly extends StatelessWidget {
  final String upText;
  final String downText;
  final moveRoute;

  TitleOnly({required this.upText, required this.downText,
    this.moveRoute, super.key}); // const ReservationTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [// 아이콘
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(upText, style: TextStyle(fontWeight: FontWeight.bold),),//2
                            Text(downText, style: TextStyle(fontSize: 12.0, color: basicColorB7),)], //3
                        ),
                      ],
                    ),
                  ),
                  // >
                  InkWell(
                      onTap: moveRoute,
                      child: Icon(Icons.navigate_next)
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(
                color: disableColor,
                height: 1, // 높이 조절
              ),
            )
          ],
        ),
      ),
    );
  }
}
