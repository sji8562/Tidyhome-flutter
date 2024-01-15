import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_change_page/widget/reservation_change_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class ReservationChangePage extends StatelessWidget {
  const ReservationChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '일정 변경하기'),
      body: const ReservationChangePageBody(),
    );
  }
}
