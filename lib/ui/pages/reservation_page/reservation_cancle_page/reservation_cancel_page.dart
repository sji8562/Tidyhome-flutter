import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_cancle_page/widget/reservation_cancel_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class ReservationCancelPage extends StatelessWidget {
  const ReservationCancelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '일정 취소하기'),
      body: const ReservationCancelPageBody(),
    );
  }
}
