import 'package:flutter/material.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/define.dart';

class ChoiceAddressTab extends StatelessWidget {
  String text;
  bool isChecked;

  ChoiceAddressTab({required this.text, required this.isChecked, super.key}); // const ReservationTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {}, // 선택 시 isChecked 변경
              child: Row(
                children: [
                  Text(text, style: TextStyle(color: isChecked == true ? basicColorB1 : disableColor,
                                              fontWeight: isChecked == true? FontWeight.bold : FontWeight.normal)),
                  Icon(Icons.check, color: isChecked == true ? primaryColor : disableColor, size: 15.0,),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: disableColor,
            ),
          )
        ],

      ),
    );
  }
}
