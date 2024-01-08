import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_tab.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';

import 'widget/icon_and_title.dart';
import 'widget/title_only.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '공지사항'),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
            ListView.builder(
                itemCount: 10, // length
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TitleOnly(upText: '개인정보처리방침 개정 안내',
                          downText: '2022년 3월 18일(금)',
                          moveRoute: () {
                            Navigator.pushNamed(context, Move.NoticeDetailPage);
                          }
                      ),
                      TitleOnly(upText: '이용약관 및 개인정보처리방침 개정 안내',
                          downText: '2021년 1월 3일(금)',
                          moveRoute: () {
                            Navigator.pushNamed(context, Move.NoticeDetailPage);
                          }),
                    ],
                  );
                })
        ));
  }
}
