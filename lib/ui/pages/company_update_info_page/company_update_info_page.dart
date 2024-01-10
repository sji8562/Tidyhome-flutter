import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/size.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/_core/utils/validator_util.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
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
            body: Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(child:
                      Text("가입하고 미소와 함께해요", style: titleStyle1(),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child:
                    Text("미소 파트너 가입을 위해선 기본 정보가 필요해요.", style: descriptionDisableStyle(),)
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text("이름 또는 업체명(상호)을 입력해주세요.", style: titleStyle2(),),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: CommonTextFormField(funValidator: validateContent,placeholderText: "상호명 입력", controller:_companyNameController,),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("예시", style: descriptionTitleDisableStyle(),),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("- 개인으로 활동하실 경우:홍길동", style: descriptionDisableStyle(),),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("- 업체로 활동하실 경우:길동이사", style: descriptionDisableStyle(),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text("사업자번호를 입력해주세요.", style: titleStyle2(),),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: CommonTextFormField(funValidator: validateContent,placeholderText: "사업자번호 입력", controller: _companyBusinessNumberController),
                  ),
                ],
              ),
            ),

                    ),
          ),
          Positioned(
            bottom: 10,
            child: ColorButton(text: "다음", funPageRoute: (){
              if (_formKey.currentState!.validate()) {
                ref.read(companyUpdateInfoProvider.notifier).setCompanyName(_companyNameController.text);
                ref.read(companyUpdateInfoProvider.notifier).setCompanyBusinessName(_companyBusinessNumberController.text);
                Navigator.pushNamed(context, Move.CompanyUpdateInfoSecondPage);
              }
            }),
          )
      ]),
    );
  }
}
