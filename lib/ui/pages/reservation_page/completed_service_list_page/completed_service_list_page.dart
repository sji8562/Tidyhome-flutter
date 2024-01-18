import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/data/model/reservation.dart';
import 'package:toyproject/ui/pages/reservation_page/completed_service_list_page/completed_service_list_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_detail_page/reservation_detail_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/icon_text.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/image_text_button.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/image_text_button_with_label.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_list_tab.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_success.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/text_label.dart';
import 'package:toyproject/ui/widget/blue_small_text_button.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/color_button_full_width.dart';
import 'package:toyproject/ui/widget/custom_modal/information_modal.dart';
import 'package:toyproject/ui/widget/divider/custom_divider.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/divider/custom_divider_thin.dart';
import 'package:toyproject/ui/widget/exclamationmark_title.dart';

import '../reservation_detail_page/reservation_detail_page.dart';

class CompletedServiceListPage extends ConsumerWidget {
  const CompletedServiceListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    CompletedReservationPageModel? completedReservationPageModel = ref.watch(completedReservationProvider);
    List<Reservation> reservations = completedReservationPageModel!.reservationList;

    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '완료된 서비스',),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child:
          ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                return
                  Column(
                  children: [
                    InkWell(
                        onTap: () {
                          int id = reservations[index].reservationId;
                          ref.read(reservationDetailProvider(id).notifier).fetchReservationDetail(id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationDetailPage(id: reservations[index].reservationId)));
                        },
                        child: ReservationListTab(service_type: reservations[index].firstCategory,
                          service_date: reservations[index].reservationDate + ' ' + reservations[index].reservationTime,
                          is_done: reservations[index].status == 3,) // 1 예약 완료, 2 예약 취소, 3 서비스 완료, 4 환불 완료
                    ),
                  ],
                );
              })
      ),
    );
  }
}
