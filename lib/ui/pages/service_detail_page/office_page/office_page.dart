import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/service_detail_page/widget/title_and_fee.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';

class OfficePage extends StatefulWidget {
  const OfficePage({super.key});

  @override
  State<OfficePage> createState() => _HouseKeeperPageState();
}

class _HouseKeeperPageState extends State<OfficePage>
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
                      Navigator.pushNamed(context, Move.CustomerPage);
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
                  ColorButton(
                      text: '사무실 청소',
                      funPageRoute: () {
                        Navigator.pushNamed(context, Move.OfficePage);
                      }),
                  const SizedBox(height: 5.0),
                  WhiteColorButton(
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
                      tabs: const [
                        Tab(text: '사무실'),
                        Tab(text: '탕비실'),
                        Tab(text: '화장실'),
                        Tab(text: '기타사항'),
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
                                    "${Define.images}office.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '· 업무 공간 바닥 청소 및 먼지 제거'
                                      '\n· 물걸레 청소'
                                      '\n· 회의실, 강의실, 흡연실 등 정리 및 청소'
                                      '\n· 집기, 가구, 전자제품 표면 청소'
                                      '\n· 정리정돈'
                                      '\n· 손이 닿는 유리창 청소'
                                      '\n· 파지함 비우기'
                                      '\n\n'
                                      '* 호텔, 모텔, 휴게소, 유흥업종, 기타 불법 사업장 청소는 진행되지 않습니다. \n'
                                      '* 자료 보호를 위해 문서 파쇄 및 개인 책상 위 청소, 물건 정리는 진행되지 않습니다.'
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'office_fees.PNG')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    "${Define.images}cupboard.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '· 설거지'
                                      '\n· 싱크대 청소 및 정리정돈'
                                      '\n· 음식물 쓰레기 배출'
                                      '\n· 조리대, 전자렌지 등 탕비실 가전 표면 청소'
                                      '\n· 수납장 정리정돈',
                                      // style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'office_fees.PNG',)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Image(image: AssetImage("${Define.images}restroom.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '· 세면대, 거울 세척'
                                      '\n· 화장대 정리 및 청소'
                                      '\n· 막대걸레를 이용한 바닥청소'
                                      '\n· 샤워실 용품 채워넣기'
                                      '\n\n'
                                      '* 샤워실 용품을 미리 준비해주세요.\n'
                                      '* 탈의실, 샤워실 포함입니다.\n'
                                      '(단, 상가, 건물 청소는 예외)',
                                      // style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'office_fees.PNG',)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    "${Define.images}mop.PNG")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '* 사업장의 단독 건물, 개별 층, 호수별 청소'
                                      '\n* 해당 사업장만 사용하는 계단, 복도, 화장실 등 청소'
                                      '\n* 사업장의 단독 건물일 경우, 승강기, 로비 등 청소'
                                      '\n* 쓰레기 분리수거 및 배출'
                                      '\n* 손에 닿는 창문, 창틀 청소'
                                      '\n* 냉장고 정리 정돈'
                                      '\n* 한 사업장이 장소적으로 분산되어 있지만, 인근에 위치한 경우'
                                      '\n(단, 이동 시간도 서비스 시간 안에 포함됩니다)',
                                      // style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TitleAndFee(title: '', imgUrl: 'office_fees.PNG',),
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
