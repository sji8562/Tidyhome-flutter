import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_tab.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';
import 'package:toyproject/ui/widget/button/soft_color_red_button.dart';

import '../widget/icon_and_title.dart';
import '../widget/title_only.dart';

class AccountClosurePage extends StatelessWidget {
  const AccountClosurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: ''),
        body: SingleChildScrollView(
          child:
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('탈퇴 요청',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text('타이디홈 이용에 불편함 점이 있으셨다면 상담을 통해 말씀 해주세요.'
                        ' 도움드릴 수 있도록 노력하겠습니다.'),
                    SizedBox(height: 20.0,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('요청 전 다음을 확인해 주세요.\n'
                          '- 별도의 안내 없이 7일 내 탈퇴 처리됩니다\n'
                          '- 진행 중인 예약, 민원, 미납금이 없어야 합니다.\n'
                          '- 적립금, 예치금, 쿠폰 등 모든 혜택이 사라집니다.\n'
                      ),
                    ),
                    Divider(
                      color: disableColor,
                      height: 20
                    ),
                    TextField(
                      maxLines: null, // 다중 행으로 설정하려면 null 또는 원하는 줄 수를 지정
                      maxLength: 300,
                      decoration: InputDecoration(
                        hintText: '내용을 입력해주세요',
                        hintStyle: TextStyle(color: disableColor),
                        border: InputBorder.none, // 밑줄 없애기
                      ),
                      onChanged: (text) {
                        // 텍스트가 변경될 때 실행되는 콜백 함수
                        print('Typed text: $text');
                      },
                    ),
                    Divider(
                        color: disableColor,
                        height: 20
                    ),
                    SoftColorRedButton(text: '탈퇴 요청하기', funPageRoute: () {}),
                  ],
                )
            ),
        ));
  }
}