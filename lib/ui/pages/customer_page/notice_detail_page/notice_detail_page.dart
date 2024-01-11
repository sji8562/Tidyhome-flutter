import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';

import '../widget/icon_and_title.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('생활청소 등 일부 서비스 선불 결제 도입 안내',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('2023년 6월 07일'),
                ),
                SizedBox(height: 50.0,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      // 이미지 있을 수도 있고 없을 수도 있음
                      Image(
                          image: AssetImage(
                              "${Define.images}airconditioner.PNG")),
                      SizedBox(height: 50.0,),
                      Text('안녕하세요, 고객님\n'
                          '항상 미소를 믿고 이용해 주셔서 감사의 말씀 드립니다.\n'
                          '\n'
                          '원활한 서비스 제공을 위해 일부 서비스가 선불 결제 방식으로 변경되어 사전 안내드립니다.'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
