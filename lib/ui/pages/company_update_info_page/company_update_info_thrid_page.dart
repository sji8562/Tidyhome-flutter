import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/company_update_info_third_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

import '../../../_core/constants/move.dart';
import '../../widget/button/color_button.dart';

class CompanyUpdateInfoThirdPage extends StatelessWidget {
  const CompanyUpdateInfoThirdPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.arrow_back, title: ""),
      body: CompanyUpdateInfoThirdPageBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ColorButton(text: "다음", funPageRoute: (){
          Navigator.pushNamed(context, Move.CompanyUpdateInfoFourthPage);
        }),
      ),
    );
  }
}
