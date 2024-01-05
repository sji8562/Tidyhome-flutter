import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

import 'widget/icon_and_title.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '문의사항'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('서비스 안내'),
              ),
            ),
            IconAndTitle(icon: CupertinoIcons.question_circle, title: '자주 묻는 질문'),
            IconAndTitle(icon: CupertinoIcons.tags, title: '서비스 상세정보'),
            IconAndTitle(icon: CupertinoIcons.news, title: '계정 탈퇴'),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('기타 안내')
              ),
            ),
            IconAndTitle(icon: CupertinoIcons.news, title: '서비스 약관'),
            IconAndTitle(icon: CupertinoIcons.info_circle, title: '버전 정보'),
          ],
        ),
      ),
    );
  }
}
