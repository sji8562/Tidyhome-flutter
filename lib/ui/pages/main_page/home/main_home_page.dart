import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/ui/pages/customer_page/widget/icon_and_title.dart';
import 'package:toyproject/ui/pages/main_page/widget/drawer_text_tab.dart';
import 'package:toyproject/ui/pages/main_page/widget/drawer_text_tab_icon.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/icon_text.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/image_text_button.dart';
import 'package:toyproject/ui/widget/divider/custom_divider_thin.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                color: basicColorW,
              );
            }),
        ),
        body: Container(
          color: primaryColor,
          child: Column(
            children: [
              SizedBox(height: 160,),
              Container(child:
                Text("대한민국 1등 홈서비스", style: TextStyle(color: basicColorW, fontSize: 30, fontWeight: FontWeight.bold),),),
              Container(
                child:
                Text("타이디홈을 만나 보세요!", style: TextStyle(color: basicColorW, fontSize: 30, fontWeight: FontWeight.bold),),),
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
        drawer: Drawer(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: ListView(
            children: [
                SizedBox(height: 60.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('나의 정보', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text('010-0000-0000'),
                      ],
                    ),
                  ),
                ),
                DrawerTextTab(icon_name: 'menu_home_icon.PNG', title: '주소 관리',
                    acting: () {
                      Navigator.pushNamed(context, Move.ChoiceAddressPage);
                    }),
                DrawerTextTabWithIcon(icon_name: Icons.list, title: '예약 내역',
                    acting: () {
                      Navigator.pushNamed(context, Move.ReservationListPage);
                    }),
                DrawerTextTab(icon_name: 'menu_card_icon.PNG', title: '결제 수단 관리'),
                DrawerTextTabWithIcon(icon_name: CupertinoIcons.speaker_2, title: '공지사항',
                    acting: () {
                      Navigator.pushNamed(context, Move.NoticePage);
                    }),
                SizedBox(height: 5,),
                DrawerTextTabWithIcon(icon_name: CupertinoIcons.question_circle, title: '문의사항',
                  acting: () {
                    Navigator.pushNamed(context, Move.CustomerPage);
                  }
                ),

                // CustomDividerThin(),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                //   child: InkWell(
                //     onTap: () {},
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Icon(CupertinoIcons.person, size: 19),
                //         SizedBox(width: 14.0,),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             textBody5('미소 파트너 지원'),
                //             Text('서비스 전문가라면 미소 파트너로\n활동해보세요')
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // )
            ],
          ),
        ),
      ),
    );
  }
}
