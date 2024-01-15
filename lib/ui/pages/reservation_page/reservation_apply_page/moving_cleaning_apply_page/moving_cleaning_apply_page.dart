import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/moving_cleaning_apply_page/widget/moving_cleaning_apply_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class MovingCleaningApplyPage extends StatelessWidget {
  const MovingCleaningApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '이사 청소 예약'),
        body: const MovingCleaningApplyPageBody()
    );
  }
}
