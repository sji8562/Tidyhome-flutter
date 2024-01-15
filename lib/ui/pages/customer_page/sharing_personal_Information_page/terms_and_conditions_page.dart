
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/customer_page/widget/icon_and_title.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class SharingPersonalInformationPage extends StatelessWidget {
  const SharingPersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '제 3자 정보 제공 동의',
          moveRoute: (){
            Navigator.pop(context);
            // Navigator.pushNamed(context, Move.TermsOfService);
          }
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('개인정보 제3자 제공 동의',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                  '''
서비스 제공을 위해 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.

1. 파트너(구직자 포함)

- 개인정보를 제공받는 자: 서비스 파트너(구직자 포함) 회원
- 제공받는 자의 개인정보 이용 목적: 서비스 진행
- 제공하는 개인정보 항목: 서비스를 신청한 개인(구인자)회원의 성명, 연락처, 주소지, 예약 정보 및 요청사항, 반려동물 유무 여부, 주민등록번호(인터넷 가입 서비스에만 해당), 결제/계좌 정보(인터넷 가입 서비스에만 해당)
- 제공받는 자의 보유 및 이용기간: 서비스 이용 종료시 까지

2. 고객(구인자 포함)

- 개인정보를 제공받는 자: 서비스 개인(고객 포함) 회원
- 제공받는 자의 이용 목적: 서비스 이용 및 이용자 보호기능
- 제공받는 개인정보 항목: 서비스 파트너(구직자) 회원의 성명, 연락처 등
- 제공받는 자의 보유 및 이용기간: 서비스 이용 종료시 까지

자세한 내용은 미소의 개인정보 처리방침을 확인해주세요.
'''
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
