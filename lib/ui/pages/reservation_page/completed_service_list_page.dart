import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/constants/style.dart';
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

class CompletedServiceListPage extends ConsumerWidget {
  const CompletedServiceListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '완료된 서비스',),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child:
          ListView.builder(
              itemCount: 10, // length
              itemBuilder: (context, index) {
                return
                  Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Move.ReservationDetailPage);
                        },
                        child: ReservationListTab(service_type: '가사도우미', service_date: '2024년 1월 25일(금) 오전 9시', is_done: true,)
                    ),
                    ReservationListTab(service_type: '가사도우미', service_date: '2024년 1월 25일(금) 오전 9시', is_done: false,),
                  ],
                );
              })
      ),
    );
  }
}
