import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_tab.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';

import '../../../../_core/constants/move.dart';
import '../../../widget/button/soft_color_button.dart';
import '../../../widget/divider/custom_divider_thin.dart';
import '../../../widget/exclamationmark_title.dart';

class Reservation {
  String category;
  String date;
  String icon;

  Reservation({
    required this.category,
    required this.date,
    required this.icon,
  });
}

class ReservationListPage extends StatelessWidget {

  const ReservationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 가상의 예약 데이터
    List<Reservation> reservations = [
      Reservation(category: '가사도우미', date: '6월 19일(일) 오전 9시', icon: 'cleaning_assistant_icon.png'),
      Reservation(category: '이사청소', date: '5월 12일(화) 오후2시', icon: 'moving_cleaning_icon.PNG'),
      Reservation(category: '사무실 청소', date: '4월 28일(목) 오후 6시', icon: 'office_cleaning_icon.png'),
    ];

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
                            icon: reservations[index].icon,
                            upText: reservations[index].category,
                            downText: reservations[index].date,
                            moveRoute: Move.MainPage,
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
