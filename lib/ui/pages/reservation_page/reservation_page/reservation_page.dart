import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/define.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_tab.dart';
import 'package:toyproject/ui/widget/loading.dart';

import '../../../../_core/constants/style.dart';
import '../../../widget/arrow_app_bar.dart';

class ReservationPage extends ConsumerWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(sessionProvider).setUser();
    ChoiceAddressPageModel? choiceAddressPageModel = ref.watch(choiceAddressProvider);
    if (choiceAddressPageModel?.addressList == null) {
      return const Loading();
    }
    String firstAddress =
        (ref.read(choiceAddressProvider.notifier).findFirstAddress()?.address ?? "기본 주소") +
            " " +
            (ref.read(choiceAddressProvider.notifier).findFirstAddress()?.addressDetail ?? "설정");

    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: "",),
      body: Column(
        children: [
          Container(
            alignment: Alignment(-0.85, 0),
            child: Text('예약하기', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,), ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal : 20, vertical: 20),
              child: Container(
                decoration: BoxDecoration(color: bgAndLineColor, borderRadius: BorderRadius.circular(5)),
                width: double.infinity,
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(firstAddress),
                      InkWell(onTap: () {
                        Navigator.pushNamed(context, Move.ChoiceAddressPage);
                      },
                        child: Icon(Icons.navigate_next, color: disableColor)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ),
            ),
          ),
          ReservationTab(icon: "cleaning_assistant_icon.png", upText: '가사도우미', downText: '2시간 29,200원부터', moveRoute: () {
            Navigator.pushNamed(context, Move.HomeWorkApplyPage);
          }),
          ReservationTab(icon: "moving_cleaning_icon.PNG", upText: '이사청소', downText: '평당 10,900원부터', moveRoute: () {
            Navigator.pushNamed(context, Move.MovingCleaningApplyPage);
          }),
          ReservationTab(icon: "office_cleaning_icon.png", upText: '사무실 청소', downText: '학원/매장/모든 사업장 즉시 예약!', moveRoute: () {
            Navigator.pushNamed(context, Move.OfficeCleaningApplyPage);
          })
        ],
      ),
    );
  }
}
