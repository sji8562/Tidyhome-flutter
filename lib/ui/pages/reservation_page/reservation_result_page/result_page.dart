import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/widget/result_page_body.dart';



class ReservationResultPage extends ConsumerWidget {
  const ReservationResultPage({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: ResultPageBody()
    );
  }
}
