import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_change_page/reservation_change_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_change_page/widget/reservation_change_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class ReservationChangePage extends ConsumerWidget {
  const ReservationChangePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '일정 변경하기', moveRoute: (){
        ref.read(reservationChangeProvider.notifier).addWhyChange();
        Navigator.pop(context);
      },),
      body: const ReservationChangePageBody(),
    );
  }
}
