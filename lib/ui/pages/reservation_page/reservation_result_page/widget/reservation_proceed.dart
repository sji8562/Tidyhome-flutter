import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';

class ReservationProceed extends StatelessWidget {
  const ReservationProceed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Icon(CupertinoIcons.checkmark_alt_circle_fill, color: primaryColor, size: 50,),
        ),
        Text('결제전 정보 확인', style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('결제를 완료해주세요'),
        ),
      ],
    );
  }
}
