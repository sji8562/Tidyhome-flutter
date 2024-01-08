import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class ReservationResultPage extends StatelessWidget {
  const ReservationResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Icon(CupertinoIcons.checkmark_alt_circle_fill, color: primaryColor, size: 50,),
          ),
          Text('감사합니다', style: TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('예약이 완료되었습니다'),
          ),
          Divider(height: 25, thickness: 5, color: bgAndLineColor,),
          Text('부가정보 입력'),
          // Row(),
          Divider(height: 25, thickness: 5, color: bgAndLineColor,),
        ],
      ),
    );
  }
}
