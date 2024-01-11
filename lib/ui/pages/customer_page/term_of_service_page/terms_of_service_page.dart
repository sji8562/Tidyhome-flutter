
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/customer_page/privacy_policy_page/privacy_policy_page.dart';
import 'package:toyproject/ui/pages/customer_page/term_and_conditions_page/terms_and_conditions_page.dart';
import 'package:toyproject/ui/pages/customer_page/widget/icon_and_title.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/title_icon_tab.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '서비스 약관',
          moveRoute: (){
            Navigator.pushNamed(context, Move.CustomerPage);
          }
      ),
      body: Column(
        children: [
            SizedBox(height: 20.0,),
            TitleIconTab(title: '이용약관', moveRoute: () {
              Navigator.pushNamed(context, Move.TermsAndConditionsPage);
            },),
            TitleIconTab(title: '개인정보 처리방침', moveRoute: () {
              Navigator.pushNamed(context, Move.PrivacyPolicyPage);
            },),
        ],
      ),
    );
  }
}
