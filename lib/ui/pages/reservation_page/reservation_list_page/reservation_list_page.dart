import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_detail_page/reservation_detail_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_list_page/reservation_list_page_view_model.dart';

import '../../../../_core/constants/move.dart';
import '../../../../data/model/reservation.dart';
import '../../../../data/store/session_store.dart';
import '../../../widget/arrow_app_bar.dart';
import '../../../widget/button/color_button.dart';
import '../../../widget/button/soft_color_button.dart';
import '../../../widget/divider/custom_divider_thin.dart';
import '../../../widget/exclamationmark_title.dart';
import '../widget/reservation_tab.dart';



class ReservationListPage extends ConsumerWidget {

  const ReservationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(sessionProvider).setUser();
    ReservationPageModel? reservationPageModel = ref.watch(reservationProvider);
    Logger().d("*-*-*-*-*-*-*");
    Logger().d(reservationPageModel!.reservationList.toString());

    List<Reservation> reservations = reservationPageModel!.reservationList;

    String _setServiceIconName(category) {
      if(category == '가사도우미') {
        return 'cleaning_assistant_icon.png';
      }
      if(category == '이사청소') {
        return 'moving_cleaning_icon.PNG';
      }
      if(category == '사무실청소') {
        return 'office_cleaning_icon.png';
      }
      return 'air_conditioner_cleaning_icon.png';
    };

    return Scaffold(
      appBar: ArrowAppBar(
        leading: Icons.keyboard_backspace,
        title: "",
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment(-0.85, 0),
            margin: const EdgeInsets.only(bottom: 40),
            child: const Text(
              '예약내역',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                if (reservations.isEmpty)
                  const Column(
                    children: [
                      ExclamationmarkTitle(
                          title: '예약된 서비스가 아직 없어요. 지금 예약해보세요!'),
                      CustomDividerThin(),
                    ],
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: reservations.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ReservationTab(
                            icon: _setServiceIconName(reservations[index].firstCategory),
                            upText: reservations[index].firstCategory,
                            downText: '${reservations[index].reservationDate} ${reservations[index].reservationTime}',
                            // TODO 값 안넘어감
                            moveRoute: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationDetailPage(id: reservations[index].reservationId)));
                            },
                          ),
                          const CustomDividerThin(),
                        ],
                      );
                    },
                  ),
                ),
                if (reservations.isEmpty)
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ColorButton(
                          text: '예약하기',
                          funPageRoute: () {
                            Navigator.pushNamed(context, Move.ReservationPage);
                          }
                      )
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SoftColorButton(
                    text: '완료된 서비스',
                    funPageRoute: () {
                      Navigator.pushNamed(context, Move.CompletedServiceListPage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
