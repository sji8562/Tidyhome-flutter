import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/define.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/choice_address_tab.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_tab.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';

import '../../../_core/constants/style.dart';
import '../../widget/arrow_app_bar.dart';

class FindAddressPage extends StatefulWidget {
  const FindAddressPage({super.key});

  @override
  State<FindAddressPage> createState() => _ChoiceAddressPageState();
}

class _ChoiceAddressPageState extends State<FindAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.close, title: "주소 등록"),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // child:
            // CustomTextFormField(),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: '주소를 검색해 주세요',
            //   ),
            // ),
          ),
          ListView.builder(
            itemCount: 10, // length
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // AddressWithDetailTab(text: '서울 강남구 테헤란로 302 위워크타워 1동1호', isChecked: false),
                  // AddressWithDetailTab(text: '서울 강남구 테헤란로 302 위워크타워 1동1호', isChecked: true),
                ],
              );
            },
          ),
          Positioned(
            bottom: 10,
            child: ColorButton(text: '확인', funPageRoute: (){
              Navigator.pushNamed(context, Move.ChoiceAddressPage);
            }),
          )
        ],

      ),
    );
  }
}
