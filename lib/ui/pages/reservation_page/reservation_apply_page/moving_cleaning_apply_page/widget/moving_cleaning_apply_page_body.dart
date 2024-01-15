import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/join_page/widget/join_text_form_field.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/moving_cleaning_apply_page/moving_cleaning_apply_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_result_page/result_page_view_model.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';

import '../../../../../../_core/constants/color.dart';
import '../../../../../../_core/utils/extract_time_util.dart';
import '../../../../../../_core/utils/validator_util.dart';
import '../../../../../../data/model/home_work_apply_field.dart';
import '../../../../../widget/button/color_button.dart';
import 'area_text_form_field.dart';
import 'j_soft_color_button.dart';

class MovingCleaningApplyPageBody extends ConsumerStatefulWidget {
  const MovingCleaningApplyPageBody({super.key});

  @override
  ConsumerState<MovingCleaningApplyPageBody> createState() => _MovingCleaningApplyPageBodyState();
}

class _MovingCleaningApplyPageBodyState extends ConsumerState<MovingCleaningApplyPageBody> {
  bool isButtonEnabled1 = true;
  bool isButtonEnabled2 = true;
  bool isButtonEnabled3 = true;
  bool isButtonEnabled4 = true;
  bool isButtonEnabled5 = true;
  bool isValidated = false;
  final areaController = TextEditingController();


  final List<TextEditingController> _homeWorkControllers = [];

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
    MovingCleaningApplyPageModel? movingCleaningApplyPageModel = ref.watch(movingCleaningApplyProvider);
    if (movingCleaningApplyPageModel?.homeWorkFields == null) {
      return Center(
        child: Image.asset('assets/images/giphy.gif', fit: BoxFit.cover, width: 200, height: 200),
      );
    }
    List<HomeWorkApplyField> homeWorkFields = movingCleaningApplyPageModel!.homeWorkFields!;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
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
                            if(index == 2 && isButtonEnabled5){
                              _showCalendarPicker(context, ref, index);
                              isButtonEnabled5 = false;
                            }
                          }, child: Text(homeWorkFields[index].question, style: TextStyle(fontWeight: FontWeight.bold))),
                          SizedBox(height: 15),
                          if(homeWorkFields[index].selectList != null && index != 1)
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
                                          ref.read(movingCleaningApplyProvider.notifier).updateAnswer(index, homeWorkFields[index].selectList![index2]);
                                          Future.delayed(Duration(seconds: 2), () {
                                            ref.read(movingCleaningApplyProvider.notifier).addAreaSize();
                                          });
                                          isButtonEnabled1 = false;
                                        }

                                        if(index == 3 && isButtonEnabled3){
                                          ref.read(movingCleaningApplyProvider.notifier).updateAnswer(index, homeWorkFields[index].selectList![index2]);
                                          isButtonEnabled3 = false;
                                          Future.delayed(Duration(seconds: 2), () {
                                            ref.read(movingCleaningApplyProvider.notifier).addHasPet();
                                          });
                                        }
                                        if(index == 4 && isButtonEnabled4){
                                          ref.read(movingCleaningApplyProvider.notifier).updateAnswer(index, homeWorkFields[index].selectList![index2]);
                                          isButtonEnabled4 = false;
                                          Future.delayed(Duration(seconds: 1), () {
                                            ref.read(movingCleaningApplyProvider.notifier).addNotice();
                                          });
                                        }

                                      },child: Text(homeWorkFields[index].selectList![index2], style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),)),),
                                    SizedBox(height: 10,),
                                  ],
                                );
                              },),
                            ),
                          if(homeWorkFields[index].selectList != null && index == 1)
                            Column(
                              children: [
                                AreaTextFormField(funValidator: validateArea, changeFormData: (value){
                                  if(validateArea(value) == null){
                                    setState(() {
                                      isValidated = true;
                                    });
                                  } else {
                                    setState(() {
                                      isValidated = false;
                                    });
                                  }
                                }, controller: areaController,placeholderText: "'평수' 기준, 숫자만 작성",),
                                JSoftColorButton(text: "확인", funPageRoute: (){
                                  if(!isValidated){
                                    return;
                                  }
                                  if(index == 1 && isButtonEnabled2){
                                    ref.read(movingCleaningApplyProvider.notifier).updateAnswer(index, areaController.text);
                                    Future.delayed(Duration(seconds: 2), () {
                                      ref.read(movingCleaningApplyProvider.notifier).addServiceDate();
                                    });
                                    isButtonEnabled2 = false;
                                  }

                                }, customColor: isValidated ? primaryColor02 : formColor,)
                              ],
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
        if(homeWorkFields.length == 6)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ColorButton(text: "예약 신청", funPageRoute: (){
              ref.read(resultPageProvider.notifier).setCleaningDate(homeWorkFields[2]!.inputAnswer!,
                  homeWorkFields[0]!.inputAnswer!, homeWorkFields[3]!.inputAnswer!, homeWorkFields[4]!.inputAnswer! == "예" ? true : false, parseInt(homeWorkFields[1]!.inputAnswer!));
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
          ref.read(movingCleaningApplyProvider.notifier).updateAnswer(index, formattedDate);
          Navigator.pop(context);
          MovingCleaningApplyPageModel? movingCleaningApplyPageModel = ref.read(movingCleaningApplyProvider);
          String answerData = movingCleaningApplyPageModel!.homeWorkFields![0].inputAnswer!;
          int serviceHour = extractHour(answerData);
          await Future.delayed(Duration(seconds: 1), () {
            ref.read(movingCleaningApplyProvider.notifier).addServiceStartTime(serviceHour);
          });
        }
      },
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
  }

}



