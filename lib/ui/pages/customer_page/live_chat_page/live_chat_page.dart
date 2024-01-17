import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/service_detail_page/widget/title_and_fee.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/color_button_no_padding.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button_no_padding.dart';
import 'package:toyproject/ui/widget/title_icon_tab.dart';

class LiveChatPage extends ConsumerStatefulWidget {
  const LiveChatPage({super.key});

  @override
  ConsumerState<LiveChatPage> createState() => _LiveChatPageState();
}

class _LiveChatPageState extends ConsumerState<LiveChatPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar:
                ArrowAppBar(leading: Icons.keyboard_backspace, title: '실시간 문의',
                    moveRoute: (){
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, Move.CustomerPage);
                    }),
            body: Stack(
              children: [
                ListView(
                  children: [

                  ],
                ),
                // Positioned(
                //   bottom: 10,
                //   child:
                // )
              ],
              // child:
                  // child:
                  //
                  //       ),
                ),
            // )
    );
  }
}
