import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/_core/utils/extract_time_util.dart';
import 'package:toyproject/data/model/home_work_apply_field.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/home_work_apply_page/home_work_apply_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page_view_model.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:toyproject/ui/widget/loading.dart';

import '../../../../../../_core/constants/color.dart';
import '../../../../../../_core/utils/validator_util.dart';

class HomeWorkApplyPageBody extends ConsumerStatefulWidget  {

  const HomeWorkApplyPageBody({super.key});

  @override
  ConsumerState<HomeWorkApplyPageBody> createState() => _HomeWorkApplyPageBodyState();
}

class _HomeWorkApplyPageBodyState extends ConsumerState<HomeWorkApplyPageBody> {
  bool isButtonEnabled1 = true;
  bool isButtonEnabled2 = true;
  bool isButtonEnabled3 = true;
  bool isButtonEnabled4 = true;
  int optionIndex = 0;
  final ScrollController _controller = ScrollController();
  final List<TextEditingController> _homeWorkControllers = [];

  void scrollToBottom() {
    // MediaQuery를 통해 화면의 높이를 구함
    double screenHeight = MediaQuery.of(context).size.height;
    // 스크롤을 최하단으로 이동
    _controller.jumpTo(screenHeight);
  }

  //유효성 검사 항목을 index에 따라 동적으로 선택하는 함수
  Function? getDynamicValidator(int index) {
    if (index == 0) {
      return validateGubun;
    } else if (index == 1){
      return validateTel;
    } else if (index == 2){
      return validateAuthNumber;
    }
    return null;
  }

  String? getDynamicValidatorName(int index, value) {
    if (index == 0) {
      return validateGubun(value);
    } else if (index == 1){
      return validateTel(value);
    } else if (index == 2){
      return validateAuthNumber(value);
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    HomeWorkApplyPageModel? homeWorkApplyPageModel = ref.watch(homeWorkApplyProvider);
    if (homeWorkApplyPageModel?.homeWorkFields == null) {
      return const Loading();
    }
    List<HomeWorkApplyField> homeWorkFields = homeWorkApplyPageModel!.homeWorkFields!;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: homeWorkFields.length,
            itemBuilder: (context, index) {
              _homeWorkControllers.addAll(List.generate(3, (_) => TextEditingController()));
              // 포커스 노드 초기화

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      width: 250,
                      decoration: BoxDecoration(
                        color: basicColorW,
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(onTap: () {
                            if(index == 1 && isButtonEnabled4){
                              _showCalendarPicker(context, ref, index);
                              isButtonEnabled4 = false;
                            }
                          }, child: Text(homeWorkFields[index].question, style: TextStyle(fontWeight: FontWeight.bold))),
                          SizedBox(height: 15),
                          if(homeWorkFields[index].selectList != null)
                          SizedBox(height: homeWorkFields[index].selectList!.length * 45,
                            child: ListView.builder(physics: NeverScrollableScrollPhysics(),itemCount: homeWorkFields[index].selectList!.length, itemBuilder: (context, index2) {
                              return Column(
                                children: [
                                  Container(
                                    alignment: Alignment(0,0),
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    width: 200,
                                    color: primaryColor02,
                                    child:
                                    InkWell(onTap: () {
                                      if(index == 0 && isButtonEnabled1){
                                        optionIndex = index2;
                                        ref.read(homeWorkApplyProvider.notifier).updateAnswer(index, homeWorkFields[index].selectList![index2]);
                                        Future.delayed(Duration(seconds: 2), () {
                                          ref.read(homeWorkApplyProvider.notifier).delServiceTime();
                                          ref.read(homeWorkApplyProvider.notifier).addServiceDate();
                                        });
                                        isButtonEnabled1 = false;
                                      }
                                      if(index == 2 && isButtonEnabled2){
                                        ref.read(homeWorkApplyProvider.notifier).updateAnswer(index, homeWorkFields[index].selectList![index2]);
                                        isButtonEnabled2 = false;
                                        Future.delayed(Duration(seconds: 2), () {
                                          ref.read(homeWorkApplyProvider.notifier).delServiceStartTime();
                                          ref.read(homeWorkApplyProvider.notifier).addHasPet();
                                        });
                                      }
                                      if(index == 3 && isButtonEnabled3){
                                        ref.read(homeWorkApplyProvider.notifier).updateAnswer(index, homeWorkFields[index].selectList![index2]);
                                        isButtonEnabled3 = false;
                                        Future.delayed(Duration(seconds: 1), () {
                                          ref.read(homeWorkApplyProvider.notifier).addNotice();
                                        });
                                      }

                                    },child: Text(homeWorkFields[index].selectList![index2], style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),)),),
                                  SizedBox(height: 10,),
                                ],
                              );
                            },),
                          )
                        ],
                      ),
                    ),
                  if(homeWorkFields[index].inputAnswer != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 170,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(homeWorkFields[index].inputAnswer!, style: TextStyle(color: basicColorW),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
          if(homeWorkFields.length == 5)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ColorButton(text: "예약 신청", funPageRoute: (){
                ref.read(resultPageProvider.notifier).setCleaningDate("가사도우미", homeWorkFields[1]!.inputAnswer!, homeWorkFields[0]!.inputAnswer!,
                    homeWorkFields[2]!.inputAnswer!, homeWorkFields[3]!.inputAnswer! == "예" ? true : false, 0, optionIndex + 1);
                Navigator.pushNamed(context, Move.ReservationResultPage);
              }),
            )
      ],
    );
  }

  Future<void> _showCalendarPicker(BuildContext context, WidgetRef ref, int index) async {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: LinearBorder(),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('날짜 선택하기', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              _buildCalendarPicker(ref, index),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCalendarPicker(WidgetRef ref, int index) {
    return CalendarDatePicker(
      onDateChanged: (DateTime? date) async {
        await initializeDateFormatting('ko_KR', null);
        if (date != null) {
          String formattedDate = DateFormat('yyyy년 MM월 dd일(EEE)', 'ko_KR').format(date);
          ref.read(homeWorkApplyProvider.notifier).updateAnswer(index, formattedDate);
          Navigator.pop(context);
          HomeWorkApplyPageModel? homeWorkApplyPageModel = ref.read(homeWorkApplyProvider);
          String answerData = homeWorkApplyPageModel!.homeWorkFields![0].inputAnswer!;
          int serviceHour = extractHour(answerData);
          await Future.delayed(Duration(seconds: 1), () {
            ref.read(homeWorkApplyProvider.notifier).addServiceStartTime(serviceHour);
          });
        }
      },
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
  }

}



