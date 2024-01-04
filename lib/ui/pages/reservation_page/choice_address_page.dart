import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/define.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/choice_address_tab.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_tab.dart';

import '../../../_core/constants/style.dart';
import '../../widget/arrow_app_bar.dart';

class ChoiceAddressPage extends StatefulWidget {
  const ChoiceAddressPage({super.key});

  @override
  State<ChoiceAddressPage> createState() => _ChoiceAddressPageState();
}

class _ChoiceAddressPageState extends State<ChoiceAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: "주소관리",),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 10, // length
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ChoiceAddressTab(text: '서울 강남구 테헤란로 302 위워크타워 1동1호', isChecked: false),
                  ChoiceAddressTab(text: '서울 강남구 테헤란로 302 위워크타워 1동1호', isChecked: true),
                ],
              );
            },
          ),
          Positioned(
            child: ElevatedButton(
                onPressed: () {},
                child: Text('새 주소 등록')),
                bottom: 10.0,
                left: 135.0,
          )
        ],

      ),
    );
  }
}
