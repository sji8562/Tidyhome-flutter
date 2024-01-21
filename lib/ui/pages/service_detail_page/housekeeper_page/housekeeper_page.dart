import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/service_detail_page/applience_page/applience_page.dart';
import 'package:toyproject/ui/pages/service_detail_page/movement_page/movement_page.dart';
import 'package:toyproject/ui/pages/service_detail_page/office_page/office_page.dart';
import 'package:toyproject/ui/pages/service_detail_page/widget/title_and_fee.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';

class HouseKeeperPage extends StatefulWidget {
  const HouseKeeperPage({super.key});

  @override
  State<HouseKeeperPage> createState() => _HouseKeeperPageState();
}

class _HouseKeeperPageState extends State<HouseKeeperPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar:
              ArrowAppBar(leading: Icons.keyboard_backspace, title: '서비스 상세정보',
                  moveRoute: (){
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, Move.CustomerPage);
                  }
              ),
          body: ListView(children: [
            Column(children: [
              Column(children: [
                ColorButton(
                    text: '가사도우미',
                    funPageRoute: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HouseKeeperPage(),));
                    }),
                const SizedBox(height: 5.0),
                WhiteColorButton(
                    text: '사무실 청소',
                    funPageRoute: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OfficePage(),));
                    }),
                const SizedBox(height: 5.0),
                WhiteColorButton(
                    text: '이사청소',
                    funPageRoute: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MovementPage(),));
                    }),
                SizedBox(height: 5.0),
                WhiteColorButton(
                    text: '가전/침대청소',
                    funPageRoute: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AppliencePage(),));

                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 30.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('서비스 범위',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: primaryColor,
                    indicatorColor: primaryColor,
                    unselectedLabelColor: disableColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: '방/거실'),
                      Tab(text: '주방'),
                      Tab(text: '욕실'),
                      Tab(text: '기타사항'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 900,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "${Define.images}housekeeping.PNG")),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    '· 침구류 정리정돈'
                                    '\n· 의류 및 생활용품 정리정돈'
                                    '\n· 침대 및 쇼파 밑 청소'
                                    '\n· 막대 걸레 이용한 바닥 걸레질'
                                    '\n· 가구 및 전자제품 표면 청소',
                                    // style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TitleAndFee(title: '', imgUrl: 'housekeeping_fees.PNG',)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "${Define.images}wash_dishes.PNG")),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    '· 설거지'
                                    '\n· 싱크대 청소 및 정리정돈'
                                    '\n· 가스렌지 외부, 전자렌지 내부 세척'
                                    '\n· 수납장 정리정돈'
                                    '\n'
                                    '\n* 전문청소가 필요한 기름때, 곰팡이, 찌든때, 물때 등은\n청소가 어렵습니다.',
                                    // style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TitleAndFee(title: '', imgUrl: 'housekeeping_fees.PNG',)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Image(image: AssetImage("${Define.images}bath.PNG")),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    '· 세면대, 거울 세척'
                                    '\n· 변기, 욕조 세척'
                                    '\n· 수납장 및 욕실 용품 정리정돈'
                                    '\n'
                                    '\n* 전문청소가 필요한 기름때, 곰팡이, 찌든때, 물때 등은\n청소가 어렵습니다.',
                                    // style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TitleAndFee(title: '', imgUrl: 'housekeeping_fees.PNG',)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Image(
                              image: AssetImage(
                                  "${Define.images}washing_machine.PNG")),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    '* 의류 및 옷장 정리정돈'
                                    '\n* 냉장고 정리정돈, 세탁기 빨래, 창틀 청소'
                                    '\n* 쓰레기 분리수거 및 배출'
                                    '\n\n'
                                    '\n*손 닿지 않는 곳의 청소는 어렵습니다.'
                                    '\n*반려 동물 배변 청소는 어렵습니다'
                                    '\n*반찬 및 국/찌개 조리는 어렵습니다.'
                                    '\n*냉장고 정리정돈과 창틀 청소는 미리 요청해주세요.',
                                    // style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TitleAndFee(title: '', imgUrl: 'housekeeping_fees.PNG',),
                        ],
                      ),
                    )
                  ],
                  controller: _tabController,
                ),
              ),
            ]),
          ]
              // child:
              //
              //       ),
              ));
  }
}
