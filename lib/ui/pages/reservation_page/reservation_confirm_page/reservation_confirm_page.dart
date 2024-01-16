import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_confirm_page/widget/result_page_body.dart';



class ReservationConfirmPage extends ConsumerWidget {
  const ReservationConfirmPage({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: ResultConfirmBody()
    );
  }
}
