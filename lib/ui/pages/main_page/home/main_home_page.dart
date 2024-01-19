import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/customer_page/widget/icon_and_title.dart';
import 'package:toyproject/ui/pages/main_page/widget/drawer_text_tab.dart';
import 'package:toyproject/ui/pages/main_page/widget/drawer_text_tab_icon.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/icon_text.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/image_text_button.dart';
import 'package:toyproject/ui/widget/divider/custom_divider_thin.dart';
import 'package:toyproject/ui/widget/loading.dart';

class MainHomePage extends ConsumerWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    SessionStore sessionStore = ref.watch(sessionProvider);

    //null 처리 : 상태값이 null일 경우, gif가 출력됨
    if(sessionStore.user == null) {
      return const Loading();
    }

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
                        Text(sessionStore.user!.tel!),
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
