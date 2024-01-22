import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/home_work_apply_page/home_work_apply_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/home_work_apply_page/widget/home_work_apply_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class HomeWorkApplyPage extends ConsumerWidget {
  const HomeWorkApplyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '가사 도우미 예약', moveRoute: (){
          ref.read(homeWorkApplyProvider.notifier).addServiceTime();
          Navigator.pushNamedAndRemoveUntil(context, Move.ReservationPage, (route) => false);
        },),
        body: const HomeWorkApplyPageBody()
    );
  }
}
