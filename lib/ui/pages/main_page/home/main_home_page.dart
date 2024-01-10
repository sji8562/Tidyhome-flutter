import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: primaryColor,
          child: Column(
            children: [
              SizedBox(height: 180,),
              Container(child:
                Text("대한민국 1등 홈서비스", style: TextStyle(color: basicColorW, fontSize: 30, fontWeight: FontWeight.bold),),),
              Align(
                alignment: Alignment(0.4, 0),
                child: Container(
                  child:
                  Text("만나 보세요!", style: TextStyle(color: basicColorW, fontSize: 30, fontWeight: FontWeight.bold),),),
              ),
              SizedBox(height: 20,),
              Container(
                width: 130,
                height: 50,
                decoration: BoxDecoration(color: basicColorW, borderRadius: BorderRadius.circular(30)),
                child:
                Center(child: InkWell(onTap: () {
                  Navigator.pushNamed(context, Move.ReservationPage);
                },child: Text("+ 예약하기", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),))),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
