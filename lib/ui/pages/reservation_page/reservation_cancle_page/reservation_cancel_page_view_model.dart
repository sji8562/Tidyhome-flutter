import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/model/home_work_apply_field.dart';

// 1. 창고 데이터
class ReservationCanclePageModel  {
  List<HomeWorkApplyField>? homeWorkFields;

  ReservationCanclePageModel(this.homeWorkFields);

  ReservationCanclePageModel copyWith({
    List<HomeWorkApplyField>? homeWorkFields,
  }) {
    return ReservationCanclePageModel(
      homeWorkFields ?? this.homeWorkFields,
    );
  }


}

// 2. 창고
class ReservationCanclePageViewModel extends StateNotifier<ReservationCanclePageModel?> {
  ReservationCanclePageViewModel(super.state);


  void addWhyChange(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "어떤 이유 때문에 취소 하시나요?", selectList: ["일정이 생겨서", "날짜, 시간 입력 실수", "기타"]);
    state = state!.copyWith(homeWorkFields: [homeWorkApplyField]);
  }

  void addChangeOrCancel(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "다른 일정으로 변경도 가능합니다. 예약을 변경해드릴까요?", selectList: ["네, 변경할게요.", "아니오, 취소할게요."]);
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
  }

  void addWhenChange(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "언제로 변경해드릴까요?");
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
  }

  void addServiceChangeTime() {
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "시작 시간은 언제가 좋으세요?", selectList: ["오전 7시 ~ 10시", "오전 9시 ~ 정오", "오전 10시 ~ 오후 1시", "오후 2시 ~ 5시", "오후 6시 ~ 9시"]);
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
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
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "아래 버튼을 누르시면 예약취소가 진행됩니다.");
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
final reservationCancelProvider =
StateNotifierProvider<ReservationCanclePageViewModel, ReservationCanclePageModel?>((ref) {
  return ReservationCanclePageViewModel(ReservationCanclePageModel([]))..addWhyChange();
});
