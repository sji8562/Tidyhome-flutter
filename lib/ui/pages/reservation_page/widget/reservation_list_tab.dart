import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/text_label.dart';
import 'package:toyproject/ui/widget/divider/custom_divider_thin.dart';

class ReservationListTab extends StatelessWidget {
  final String service_type;
  final String service_date;
  final bool is_done;

  const ReservationListTab({super.key, required this.service_type, required this.service_date, required this.is_done});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service_type, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(service_date, style: TextStyle(color: disableColor),)
                ],
              ),
            ),
            TextLabel(text: is_done ? '서비스 완료' : '예약 취소' , is_active: is_done,)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        CustomDividerThin(horizontal: 5.0),
      ],
    );;
  }
}
