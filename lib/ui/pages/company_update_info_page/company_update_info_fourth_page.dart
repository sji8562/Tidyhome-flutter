import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_code_table/company_code_table.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/company_update_info_fourh_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';

import '../../../_core/constants/move.dart';

class CompanyUpdateInfoFourthPage extends StatelessWidget {
  const CompanyUpdateInfoFourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.arrow_back, title: ""),
      body: CompanyUpdateInfoFourthPageBody(),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ColorButton(text: "확인", funPageRoute: (){
        Navigator.pushNamed(context, Move.CompanyUpdateInfoLastPage);
      },),
    )
    );
  }
}
