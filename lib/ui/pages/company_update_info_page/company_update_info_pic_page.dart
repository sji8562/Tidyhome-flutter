import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/data/dto/request_dto/user/user_request.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/company_update_info_pic_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/loading.dart';

import '../../../_core/constants/move.dart';

class CompanyUpdateInfoPicPage extends ConsumerStatefulWidget {
  const CompanyUpdateInfoPicPage({super.key});

  @override
  ConsumerState<CompanyUpdateInfoPicPage> createState() => _CompanyUpdateInfoPicState();
}

class _CompanyUpdateInfoPicState extends ConsumerState<CompanyUpdateInfoPicPage> {
  @override
  Widget build(BuildContext context) {
    CompanyUpdateInfoPagesModel? companyUpdateInfoPagesModel = ref.watch(companyUpdateInfoProvider);
    if(companyUpdateInfoPagesModel == null ){
      return Loading();
    }
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.arrow_back, title: ""),
      body: CompanyUpdateInfoPicPageBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ColorButton(text: "확인", funPageRoute: (){
          PartnerUpdateDTO request = PartnerUpdateDTO(companyUpdateInfoPagesModel!.companyName, companyUpdateInfoPagesModel!.companyBusinessNumber, companyUpdateInfoPagesModel!.userPic!);
          ref.read(sessionProvider).partnerUpdate(request);
        }),
      ),

    );
  }
}
