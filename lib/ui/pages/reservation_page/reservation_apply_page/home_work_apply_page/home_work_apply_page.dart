import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/home_work_apply_page/widget/home_work_apply_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class HomeWorkApplyPage extends StatelessWidget {
  const HomeWorkApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '가사 도우미 예약'),
        body: const HomeWorkApplyPageBody()
    );
  }
}
