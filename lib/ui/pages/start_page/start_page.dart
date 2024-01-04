import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/text_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30,),
            Container(child:Image.asset(Define.images + "start.png", width: 500, height: 300,)),
            SizedBox(height: 20,),
            Container(alignment: Alignment(-0.6, 0),child: Text("400만이 선택한", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
            Container(alignment: Alignment(-0.45, 0),child: Text("홈 서비스 타이디 홈", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),),
            SizedBox(height: 20,),
            Container(alignment: Alignment(-0.25, 0), child: Text("모두의 일상이 행복하도록 미소가 함께할게요", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            SizedBox(height: 200,),
            Container(child: ColorButton(text: "시작하기", funPageRoute: (){
              Navigator.pushNamed(context, Move.StartPage);

            },)
            )],
        ),
      ),
    );
  }
}
