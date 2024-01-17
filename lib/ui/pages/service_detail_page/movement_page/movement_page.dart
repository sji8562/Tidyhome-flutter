import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/service_detail_page/widget/title_and_fee.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';

class MovementPage extends StatefulWidget {
  const MovementPage({super.key});

  @override
  State<MovementPage> createState() => _HouseKeeperPageState();
}

class _HouseKeeperPageState extends State<MovementPage>
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
                    }),
            body: ListView(children: [
              Column(children: [
                Column(children: [
                  WhiteColorButton(
                      text: '가사도우미',
                      funPageRoute: () {
                        Navigator.pushNamed(context, Move.HouseKeeperPage);
                      }),
                  const SizedBox(height: 5.0),
                  WhiteColorButton(
                      text: '사무실 청소',
                      funPageRoute: () {
                        Navigator.pushNamed(context, Move.OfficePage);
                      }),
                  const SizedBox(height: 5.0),
                  ColorButton(
                      text: '이사청소',
                      funPageRoute: () {
                        Navigator.pushNamed(context, Move.MovementPage);
                      }),
                  SizedBox(height: 5.0),
                  WhiteColorButton(
                      text: '가전/침대청소',
                      funPageRoute: () {
                        Navigator.pushNamed(context, Move.AppliencePage);
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
                      labelStyle: TextStyle(fontSize: 11.2),
                      tabs: const [
                        Tab(text: '방/거실'),
                        Tab(text: '주방/욕실'),
                        Tab(text: '현관/베란다'),
                        Tab(text: '창/바닥'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1000,
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    "${Define.images}empty_space.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '· 몰딩 도배 풀 및 오염 제거'
                                      '\n· 벽지(천장, 벽) 먼지 제거 후 바닥 청소'
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'movement_fees.PNG')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    "${Define.images}kitchen.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '· 싱크대 후드, 싱크대 장 안쪽 청소'
                                      '\n· 가스레인지 청소'
                                      '\n· 욕실바닥, 타일 때 제거'
                                      '\n· 각종 얼룩, 배수구, 변기, 세면대 청소 및 살균 소독'
                                      //, style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'movement_fees.PNG',)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Image(image: AssetImage("${Define.images}mop_floor.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '· 베란다 벽면 먼지, 거미줄 제거, 바닥 물청소'
                                      '\n· 현관문, 바닥, 신발장 외부 먼지 및 묵은 때 제거'
                                      // style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'movement_fees.PNG',)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    "${Define.images}empty_space2.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '· 전용 세제로 바닥 오염 물질 제거 후 청소'
                                      '\n· 배수구, 하수구 청소'
                                      '\n· 창틀, 유리청소, 방충망 오염물 제거'
                                      '\n· 외창 제외'
                                      // style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'movement_fees.PNG',),
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
