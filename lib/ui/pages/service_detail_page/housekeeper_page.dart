import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';

class HouseKeeperPage extends StatefulWidget {
  const HouseKeeperPage({super.key});

  @override
  State<HouseKeeperPage> createState() => _HouseKeeperPageState();
}

class _HouseKeeperPageState extends State<HouseKeeperPage> with SingleTickerProviderStateMixin {

  TabController? _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '서비스 상세정보'),
      body:
        Column(
          children: [
            ColorButton(text: '가사도우미', funPageRoute: (){
              Navigator.pushNamed(context, Move.FindAddressPage);
            }),
            SizedBox(height: 5.0),
            WhiteColorButton(text: '사무실 청소', funPageRoute: (){
              Navigator.pushNamed(context, Move.FindAddressPage);
            }),
            SizedBox(height: 5.0),
            WhiteColorButton(text: '이사청소', funPageRoute: (){
              Navigator.pushNamed(context, Move.FindAddressPage);
            }),
            SizedBox(height: 5.0),
            WhiteColorButton(text: '가전/침대청소', funPageRoute: (){
              Navigator.pushNamed(context, Move.FindAddressPage);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('서비스 범위', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,))
              ),
            ),
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
                  tabs: [
                    Tab(text: '방/거실'),
                    Tab(text: '주방'),
                    Tab(text: '욕실'),
                    Tab(text: '기타사항'),
                  ],
                ),
              ),
            ),
            Expanded(child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Image(image: AssetImage("${Define.images}housekeeping.PNG")),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text('· 침구류 정리정돈\n· 의류 및 생활용품 정리정돈'
                                '\n· 침대 및 쇼파 밑 청소\n· 막대 걸레 이용한 바닥 걸레질'
                                '\n· 가구 및 전자제품 표면 청소'),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ], controller: _tabController,))
      ],
      ),

    );
  }
}
