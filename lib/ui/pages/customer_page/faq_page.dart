import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/service_detail_page/widget/title_and_fee.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/color_button_no_padding.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button_no_padding.dart';
import 'package:toyproject/ui/widget/title_icon_tab.dart';

enum ServiceType { HouseKeeper, Office, Movement, Applience, Pay, Setting }

class FaqPage extends ConsumerStatefulWidget {
  const FaqPage({super.key});

  @override
  ConsumerState<FaqPage> createState() => _HouseKeeperPageState();
}

class _HouseKeeperPageState extends ConsumerState<FaqPage> {
  ServiceType selectedService = ServiceType.HouseKeeper;

  void _changeButtonComponent(value) {
    setState(() {
      selectedService = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar:
                ArrowAppBar(leading: Icons.keyboard_backspace, title: '자주 묻는 질문',
                    moveRoute: (){
                      Navigator.pushNamed(context, Move.CustomerPage);
                    }),
            body: Stack(
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5.0,),
                              Expanded(flex: 1, child: buildServiceButton(ServiceType.HouseKeeper, '가사도우미')),
                              SizedBox(width: 5.0,),
                              Expanded(flex:1, child: buildServiceButton(ServiceType.Office, '사무실 청소')),
                              SizedBox(width: 5.0,),
                              Expanded(flex: 1, child: buildServiceButton(ServiceType.Movement, '이사청소'),),
                              SizedBox(width: 5.0,),
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            children: [
                              SizedBox(width: 5.0,),
                              Expanded(flex: 1, child: buildServiceButton(ServiceType.Applience, '가전/침대청소'),),
                              SizedBox(width: 5.0,),
                              Expanded(flex:1, child: buildServiceButton(ServiceType.Pay, '결제/예약')),
                              SizedBox(width: 5.0,),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: buildServiceButton(ServiceType.Setting, '개인정보/환경설정'),
                          ),
                          // TODO 선택된 값에 따라 DB에서 List 불러오기
                          SizedBox(height: 40.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Text('서비스 이용', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), alignment: Alignment.centerLeft,
                            ),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ExpansionTile(
                                    title: Text(
                                      "Q. 가사도우미 서비스 종류에는 어떤 게 있나요?",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text('''
1회 청소와 정기 청소 중 선택할 수 있습니다.
1회 청소는 고객 집에 한 번 방문하여 가정집 생활청소를 진행합니다.
정기 청소는 동일한 클리너가 정기적으로 고객님 댁을 방문하는 고객 맞춤형 서비스입니다.
원하실 경우 클리너는 언제든지 변경할 수 있습니다.'''),
                                          ),
                                         color: bgAndLineColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 60.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text('간편예약', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), alignment: Alignment.centerLeft,
                            ),
                          ),
                          Container(
                            child: ExpansionTile(
                              title: Text(
                                "Q. 가사도우미 서비스 종류에는 어떤 게 있나요?",
                                style: TextStyle(fontSize: 14),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Text('''
1회 청소와 정기 청소 중 선택할 수 있습니다.
1회 청소는 고객 집에 한 번 방문하여 가정집 생활청소를 진행합니다.
정기 청소는 동일한 클리너가 정기적으로 고객님 댁을 방문하는 고객 맞춤형 서비스입니다.
원하실 경우 클리너는 언제든지 변경할 수 있습니다.
                                '''),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 60.0,)
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: SoftColorButton(text: '실시간 문의', funPageRoute: (){
                    // TODO 경로 수정 필요 -> 실시간 문의 페이지로 이동
                    Navigator.pushNamed(context, Move.FindAddressPage);
                  }),
                )
              ],
              // child:
                  // child:
                  //
                  //       ),
                ),
            // )
    );
  }

  Widget buildServiceButton(ServiceType serviceType, String text) {
    bool isSelected = selectedService == serviceType;

    return isSelected
        ? ColorButtonNoPadding(
      text: text,
      funPageRoute: () {
        // print('${text}선택해제');
      },
    )
        : WhiteColorButtonNoPadding(
      text: text,
      funPageRoute: () {
        _changeButtonComponent(serviceType);
      },
    );
  }
}
