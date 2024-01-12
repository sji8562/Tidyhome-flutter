import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/user_pic.dart';

import '../../../../_core/constants/style.dart';
import '../../../../_core/utils/validator_util.dart';
import '../../../widget/text_form_field/common_text_form_field.dart';
import '../company_update_info_pages_view_model.dart';

class CompanyUpdateInfoPicPageBody extends ConsumerWidget {
  const CompanyUpdateInfoPicPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
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
    );
  }
}
