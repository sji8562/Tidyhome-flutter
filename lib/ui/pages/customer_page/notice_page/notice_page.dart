import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/customer_page/notice_detail_page/notice_detail_page.dart';
import 'package:toyproject/ui/pages/customer_page/notice_page/notice_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/reservation_tab.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';

import '../../../../data/model/notice.dart';
import '../widget/icon_and_title.dart';
import '../widget/title_only.dart';

class NoticePage extends ConsumerWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NoticePageModel? noticePageModel = ref.watch(noticeProvider);

    Logger().d("*-*-*-*-*-*-*");
    Logger().d(noticePageModel!.noticeList.toString());

    //null 처리 : 상태값이 null일 경우, gif가 출력됨
    if(noticePageModel?.noticeList == null || noticePageModel?.noticeList.length == 0) {
      return Center(
        child: Image.asset('assets/images/giphy.gif', fit: BoxFit.cover, width: 200, height: 200),
      );
    }
    List<Notice> notices = noticePageModel!.noticeList;

    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '공지사항'),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
            ListView.builder(
                itemCount: notices.length, // length
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TitleOnly(upText: notices[index].title,
                          downText: notices[index].getFormattedDate(),
                          moveRoute: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeDetailPage(id: notices[index].id)));
                          }
                      ),
                    ],
                  );
                })
        ));
  }
}
