import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/moving_cleaning_apply_page/moving_cleaning_apply_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/moving_cleaning_apply_page/widget/moving_cleaning_apply_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class MovingCleaningApplyPage extends ConsumerWidget {
  const MovingCleaningApplyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '이사 청소 예약', moveRoute: (){
          ref.read(movingCleaningApplyProvider.notifier).addServiceTime();
          Navigator.pushNamedAndRemoveUntil(context, Move.ReservationPage, (route) => false);
        },),
        body: const MovingCleaningApplyPageBody()
    );
  }
}
