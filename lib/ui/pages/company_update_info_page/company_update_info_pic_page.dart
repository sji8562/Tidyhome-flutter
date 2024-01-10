import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/_core/utils/validator_util.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/user_pic.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/text_form_field/common_text_form_field.dart';

class CompanyUpdateInfoPicPage extends ConsumerStatefulWidget {
  const CompanyUpdateInfoPicPage({super.key});

  @override
  ConsumerState<CompanyUpdateInfoPicPage> createState() => _CompanyUpdateInfoPicState();
}

class _CompanyUpdateInfoPicState extends ConsumerState<CompanyUpdateInfoPicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.arrow_back, title: ""),
      body: SingleChildScrollView(
        // resizeToAvoidBottomInset을 true로 설정하여 키보드가 나타날 때 화면을 자동으로 조절
        // (디폴트는 true이므로 생략 가능)
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 0),
              child: Text("프로필 사진 등록", style: titleStyleBig(),),
            ),
            UserPic(onImageSelected: (imageUrl){
              ref.read(companyUpdateInfoProvider.notifier).setUserPic(imageUrl!);
            }),
            Align(alignment: Alignment(-0.8, 0),child: Text("한 줄 소개", style: titleStyle1(),)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: CommonTextFormField(placeholderText: "한 줄 소개",funValidator: validateContent, maxLength: 40,),
            ),
          ],
        ),
      ),
    );
  }
}
