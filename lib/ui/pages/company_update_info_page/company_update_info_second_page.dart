import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/company_update_info_second_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';

import '../../../_core/constants/move.dart';
import 'company_code_table/company_code_table.dart';

class CompanyUpdateInfoSecondPage extends ConsumerStatefulWidget {
  const CompanyUpdateInfoSecondPage({super.key});

  @override
  ConsumerState<CompanyUpdateInfoSecondPage> createState() => _CompanyUpdateInfoSecondPageState();
}

class _CompanyUpdateInfoSecondPageState extends ConsumerState<CompanyUpdateInfoSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
        appBar: ArrowAppBar(leading: Icons.arrow_back, title: "",),
        body: CompanyUpdateInfoSecondPageBody(),
      ),
      Positioned(
        bottom: 20,
        child: ColorButton(text: "${ref.read(companyUpdateInfoProvider.notifier).selectedServiceTypes().length}개 선택", funPageRoute: (){
              Navigator.pushNamed(context, Move.CompanyUpdateInfoThirdPage);
        }),
      )]
    );
  }
}
