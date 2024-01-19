import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_cancle_page/reservation_cancel_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_cancle_page/widget/reservation_cancel_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class ReservationCancelPage extends ConsumerWidget {
  const ReservationCancelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '일정 취소하기', moveRoute: (){
        ref.read(reservationCancelProvider.notifier).addWhyChange();
        Navigator.pop(context);
      },),
      body: const ReservationCancelPageBody(),
    );
  }
}
