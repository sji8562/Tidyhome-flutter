import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/size.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/_core/utils/validator_util.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/company_update_info_page_body.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/text_form_field/common_text_form_field.dart';

import '../../../_core/constants/move.dart';

class CompanyUpdateInfoPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _companyBusinessNumberController = TextEditingController();

  CompanyUpdateInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Stack(
        children: [
          Form(
            key: _formKey,
            child: Scaffold(
            body: CompanyUpdateInfoPageBody(_companyNameController, _companyBusinessNumberController),
            ),
          ),
          Positioned(
            bottom: 20,
            child: ColorButton(text: "다음", funPageRoute: (){
              if (_formKey.currentState!.validate()) {
                ref.read(companyUpdateInfoProvider.notifier).setCompanyName(_companyNameController.text);
                ref.read(companyUpdateInfoProvider.notifier).setCompanyBusinessNumber(_companyBusinessNumberController.text);
                Navigator.pushNamed(context, Move.CompanyUpdateInfoSecondPage);
              }
            }),
          )
      ]),
    );
  }
}
