import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/ui/widget/arrow_board/checked_tap.dart';
import 'package:toyproject/ui/widget/arrow_board/chked_tap_no_arrow.dart';

import '../../../../_core/constants/Define.dart';
import '../../../../_core/constants/move.dart';
import '../../../widget/button/color_button.dart';

class StartPageBody extends StatelessWidget {
  const StartPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30,),
            Container(child:Image.asset(Define.images + "start.png", width: 500, height: 300,)),
            SizedBox(height: 10,),
            Container(alignment: Alignment(-0.6, 0),child: Text("400만이 선택한", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
            Container(alignment: Alignment(-0.45, 0),child: Text("홈 서비스 타이디 홈", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),),
            SizedBox(height: 20,),
            Container(alignment: Alignment(-0.25, 0), child: Text("모두의 일상이 행복하도록 미소가 함께할게요", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            SizedBox(height: 200,),
            Container(child: ColorButton(text: "시작하기", funPageRoute: (){
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
                                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 15),
                                child: Text("서비스 이용을 위해 동의가 필요해요", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                          CheckedTap(text: "[필수] 서비스 이용 약관", moveRoute: Move.StartPage),
                          CheckedTap(text: "[필수] 개인정보 수집 및 이용동의", moveRoute: Move.StartPage),
                          CheckedTap(text: "[필수] 개인정보 제3자 제공 동의", moveRoute: Move.StartPage),
                          CheckedTapNoArrow(text: "[필수] 만 14세 이상이에요", moveRoute: Move.StartPage),
                          SizedBox(height: 20,),
                          ColorButton(text: "동의 후 시작하기", funPageRoute: (){
                            Navigator.pushNamed(context, Move.StartPage);
                          })
                        ],
                      ),
                    );
                  },
                );
            },)
            )],
        ),
      ),
    );
  }
}
