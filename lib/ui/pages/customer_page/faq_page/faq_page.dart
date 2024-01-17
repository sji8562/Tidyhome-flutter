import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/model/Faq.dart';
import 'package:toyproject/ui/pages/customer_page/faq_page/faq_page_view_model.dart';
import 'package:toyproject/ui/pages/service_detail_page/widget/title_and_fee.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:toyproject/ui/widget/button/color_button_no_padding.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button.dart';
import 'package:toyproject/ui/widget/button/white_color_button_no_padding.dart';
import 'package:toyproject/ui/widget/loading.dart';
import 'package:toyproject/ui/widget/title_icon_tab.dart';

enum ServiceType { HouseKeeper, Office, Movement, Applience, Pay, Setting }

class FaqPage extends ConsumerStatefulWidget {
  const FaqPage({super.key});

  @override
  ConsumerState<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends ConsumerState<FaqPage> {
  ServiceType selectedService = ServiceType.HouseKeeper;
  int partId = 3;

  void _changeButtonComponent(value) {
    setState(() {
      selectedService = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        FaqPageModel? faqPageModel = ref.watch(faqProvider);

        //null 처리 : 상태값이 null일 경우, gif가 출력됨
        if(faqPageModel?.faqList == null || faqPageModel?.faqList.length == 0) {
          return const Loading();
        }

        List<Faq> faqListCode1 = faqPageModel!.faqList.where((el) => el.code == 1).toList();
        List<Faq> faqListCode2 = faqPageModel!.faqList.where((el) => el.code == 2).toList();

        return Scaffold(
            appBar:
                ArrowAppBar(leading: Icons.keyboard_backspace, title: '자주 묻는 질문',
                    moveRoute: (){
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, Move.CustomerPage);
                    }),
            body: Stack(
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5.0,),
                              Expanded(flex: 1, child: buildServiceButton(ServiceType.HouseKeeper, '가사도우미', 3)),
                              SizedBox(width: 5.0,),
                              Expanded(flex:1, child: buildServiceButton(ServiceType.Office, '사무실 청소', 4)),
                              SizedBox(width: 5.0,),
                              Expanded(flex: 1, child: buildServiceButton(ServiceType.Movement, '이사청소', 5),),
                              SizedBox(width: 5.0,),
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            children: [
                              SizedBox(width: 5.0,),
                              // Expanded(flex: 1, child: buildServiceButton(ServiceType.Applience, '가전/침대청소', 6),),
                              // SizedBox(width: 5.0,),
                              Expanded(flex:1, child: buildServiceButton(ServiceType.Pay, '결제/예약', 1)),
                              SizedBox(width: 5.0,),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: buildServiceButton(ServiceType.Setting, '개인정보/환경설정', 2),
                          ),
                          SizedBox(height: 40.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Text('서비스 이용', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), alignment: Alignment.centerLeft,
                            ),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: faqListCode1.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ExpansionTile(
                                    title: Text(
                                      faqListCode1[index].title,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(faqListCode1[index].content),
                                          ),
                                         color: bgAndLineColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 60.0,),
                          if (faqListCode2.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text('서비스 요금', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: faqListCode2.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ExpansionTile(
                                      title: Text(
                                        faqListCode2[index].title,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Text(faqListCode2[index].content),
                                            ),
                                            color: bgAndLineColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 60.0,)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }

  Widget buildServiceButton(ServiceType serviceType, String text, partId) {
    bool isSelected = selectedService == serviceType;

    return isSelected
        ? ColorButtonNoPadding(
      text: text,
      funPageRoute: () {
        // print('${text}선택해제');
      },
    )
        : WhiteColorButtonNoPadding(
      text: text,
      funPageRoute: () {
        _changeButtonComponent(serviceType);
        ref.read(faqProvider.notifier).fetchFaq(partId);
        // 여기서 fetchFaq(id) 호출
      },
    );
  }
}
