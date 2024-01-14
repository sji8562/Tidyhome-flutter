import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/office_cleaning_apply_page/widget/office_cleaning_apply_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class OfficeCleaningApplyPage extends StatelessWidget {
  const OfficeCleaningApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '사무실 청소 예약'),
        body: const OfficeCleaningApplyPageBody()
    );
  }
}
