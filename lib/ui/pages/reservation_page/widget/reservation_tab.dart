import 'package:flutter/material.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/define.dart';

class ReservationTab extends StatelessWidget {
  final String icon;
  final String upText;
  final String downText;
  final moveRoute;


  ReservationTab({required this.icon, required this.upText, required this.downText,
    this.moveRoute, super.key}); // const ReservationTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Row(
            children: [
              Container(
                child: Row(
                  children: [// 아이콘
                    Image.asset(Define.icons + icon), //1
                    SizedBox(width: 15,),
                    // Text -> Column
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
                  onTap: moveRoute == null ? () {} : moveRoute,
                  child: Icon(Icons.navigate_next))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
