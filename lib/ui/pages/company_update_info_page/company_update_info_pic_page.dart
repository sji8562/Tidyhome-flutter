import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/company_update_info_pic_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';

import '../../../_core/constants/move.dart';

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
      body: CompanyUpdateInfoPicPageBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ColorButton(text: "확인", funPageRoute: (){
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            shape: LinearBorder(),
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 310,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70, left: 20, bottom: 15),
                          child: Text("파트너 회원가입을 환영합니다.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    Align(
                        alignment:Alignment(-0.7,0), child: Text("미소와 함께 즐거운 하루 보내세요")),
                    SizedBox(height: 20,),
                    ColorButton(text: "시작하기", funPageRoute: (){
                      Navigator.pushNamed(context, Move.MainPage);
                    })
                  ],
                ),
              );
            },
          );
        }),
      ),

    );
  }
}
