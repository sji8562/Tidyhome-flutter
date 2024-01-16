import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../../data/model/home_work_apply_field.dart';

// 1. 창고 데이터
class OfficeCleaningApplyPageModel  {
  List<HomeWorkApplyField>? homeWorkFields;

  OfficeCleaningApplyPageModel(this.homeWorkFields);

  OfficeCleaningApplyPageModel copyWith({
    List<HomeWorkApplyField>? homeWorkFields,
  }) {
    return OfficeCleaningApplyPageModel(
      homeWorkFields ?? this.homeWorkFields,
    );
  }


}

// 2. 창고
class OfficeCleaningApplyPageViewModel extends StateNotifier<OfficeCleaningApplyPageModel?> {
  OfficeCleaningApplyPageViewModel(super.state);

  void addServiceTime() {
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "서비스 시간은 얼마나 필요하신가요?", selectList: ["2시간/38,900원", "4시간/51,900원", "6시간/64,900원", "8시간/112,900원"]);
    state = state!.copyWith(homeWorkFields: [homeWorkApplyField]);
  }

  void addServiceDate() {
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "청소는 언제로 도와드릴까요? (클릭)");
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
  }

  void addServiceStartTime(int serviceHours) {

    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(
        question: "시간은 언제가 좋으세요?",
        selectList: []);

    // 시작 시간은 오전 9시
    int startHour = 9;

    // 각 구간에 대해 반복
    for (int i = 0; i < (24/ serviceHours); i++) {
      // 종료 시간을 계산
      int endHour = startHour + serviceHours;

      String timeOfDayStart = startHour < 12 ? "오전" : "오후";
      String timeOfDayEnd = endHour < 12 ? "오전" : "오후";

      // 오전 12시부터는 12를 뺀 나머지로 시작
      int adjustedStartHour = startHour <= 12 ? startHour : startHour % 12;
      int adjustedEndHour = endHour <= 12 ? endHour : endHour % 12;

      // 종료 시간이 23시를 넘어가거나, 오후 11시까지 허용되는 경우
      if (endHour > 23 || (endHour == 23 && endHour == 11)) {
        break;
      }
      // 구간을 selectList에 추가
      homeWorkApplyField.selectList!.add("$timeOfDayStart $adjustedStartHour시 ~ $timeOfDayEnd $adjustedEndHour시");

      // 다음 구간의 시작 시간 설정
      startHour = endHour;

      // 종료 시간이 23시를 넘어가면 반복 종료
      if (endHour >= 23) {
        break;
      }
    }
    // 기존 homeWorkFields에 새로운 HomeWorkApplyField 추가
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
  }

  void addHasPet(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "혹시 반려동물이 있으신가요?", selectList: ["예", "아니오"]);
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
  }

  void addNotice(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "아래 버튼을 누르시면 예약신청이 진행됩니다.");
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
  }

  void updateAnswer(int index, String answer) {
    state = state?.copyWith(
      homeWorkFields: state!.homeWorkFields!.asMap().map((i, homeWorkField) {
        if (i == index) {
          return MapEntry(i, homeWorkField.copyWith(inputAnswer: answer));
        }  else {
          return MapEntry(i, homeWorkField);
        }
      }).values.toList(),
    );
  }


}



// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final officeCleaningApplyProvider =
StateNotifierProvider< OfficeCleaningApplyPageViewModel,  OfficeCleaningApplyPageModel?>((ref) {
  return  OfficeCleaningApplyPageViewModel( OfficeCleaningApplyPageModel([]))..addServiceTime();
});
