import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/service_detail_page/widget/title_and_fee.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';

class AppliencePage extends StatefulWidget {
  const AppliencePage({super.key});

  @override
  State<AppliencePage> createState() => _HouseKeeperPageState();
}

class _HouseKeeperPageState extends State<AppliencePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
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
                  WhiteColorButton(
                      text: '이사청소',
                      funPageRoute: () {
                        Navigator.pushNamed(context, Move.MovementPage);
                      }),
                  SizedBox(height: 5.0),
                  ColorButton(
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
                        Tab(text: '에어컨'),
                        Tab(text: '세탁기'),
                        Tab(text: '매트리스'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 700,
                  child: TabBarView(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Image(
                                image: AssetImage(
                                    "${Define.images}airconditioner.PNG")),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Image(
                            image: AssetImage(
                                "${Define.images}washing_machines.PNG")),
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          child: Image(image: AssetImage("${Define.images}beds.PNG"))),
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
