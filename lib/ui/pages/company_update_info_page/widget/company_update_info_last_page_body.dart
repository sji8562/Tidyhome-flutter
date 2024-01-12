import 'package:flutter/material.dart';

import '../../../../_core/constants/Define.dart';
import '../../../../_core/constants/move.dart';
import '../../../widget/button/color_button.dart';

class CompanyUpdateInfoLastPageBody extends StatelessWidget {
  const CompanyUpdateInfoLastPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 30,),
          Container(child:Image.asset(Define.images + "basicprofile.png", width: 500, height: 300,)),
          SizedBox(height: 10,),
          Container(alignment: Alignment(-0.6, 0),child: Text("프로필 사진을", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
          Container(alignment: Alignment(-0.6, 0),child: Text("등록해보세요", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),),
          SizedBox(height: 20,),
          Container(alignment: Alignment(-0.5, 0), child: Text("고객의 신뢰가 한층 더 올라갑니다!", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
          SizedBox(height: 200,),
          ColorButton(text: "사진 등록", funPageRoute: (){
            Navigator.pushNamed(context, Move.CompanyUpdateInfoPicPage);
          })
        ])
    ;
  }
}
