import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/model/notice.dart';
import 'package:toyproject/ui/pages/customer_page/notice_detail_page/notice_detail_page_view_model.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';
import 'package:toyproject/ui/widget/loading.dart';

import '../../../../_core/constants/color.dart';
import '../widget/icon_and_title.dart';

class NoticeDetailPage extends ConsumerWidget {
  int id;

  NoticeDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NoticeDetailPageModel? noticeDetailPageModel = ref.watch(noticeDetailProvider(id));
    Logger().d("**********************");
    Logger().d(noticeDetailPageModel!.notice.toString());

    //null 처리 : 상태값이 null일 경우, gif가 출력됨
    if(noticeDetailPageModel?.notice == null) {
      return Loading();
    }

    Notice notice = noticeDetailPageModel!.notice!;

    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(notice.title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(notice.getFormattedDate()),
                ),
                SizedBox(height: 50.0,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      // 이미지 있을 수도 있고 없을 수도 있음
                      // Image(
                      //     image: AssetImage(
                      //         "${Define.images}airconditioner.PNG")),
                      SizedBox(height: 50.0,),
                      Text(notice.content),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
