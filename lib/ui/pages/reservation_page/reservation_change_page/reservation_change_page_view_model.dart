import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/dto/request_dto/reservation/reservation_request.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/cleaning_date.dart';
import 'package:toyproject/data/repository/reservation_repository.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/main.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_detail_page/reservation_detail_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_list_page/reservation_list_page_view_model.dart';
import '../../../../../data/model/home_work_apply_field.dart';

// 1. 창고 데이터
class ReservationChangePageModel  {
  List<HomeWorkApplyField>? homeWorkFields;
  CleaningDate? cleaningDate;
  int? reservationId;

  ReservationChangePageModel(this.homeWorkFields, this.cleaningDate, this.reservationId);

  ReservationChangePageModel copyWith({
    List<HomeWorkApplyField>? homeWorkFields,
    CleaningDate? cleaningDate,
    int? reservationId
  }) {
    return ReservationChangePageModel(
      homeWorkFields ?? this.homeWorkFields,
        cleaningDate ?? this.cleaningDate,
        reservationId ?? this.reservationId
    );
  }


}

// 2. 창고
class ReservationChangePageViewModel extends StateNotifier<ReservationChangePageModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  ReservationChangePageViewModel(super.state, this.ref);


  void setReservationId(int id){
    state = state!.copyWith(reservationId: id);
  }

  void addWhyChange(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "어떤 이유 때문에 변경하시나요?", selectList: ["일정이 생겨서", "날짜, 시간 입력 실수", "기타"]);
    state = state!.copyWith(homeWorkFields: [homeWorkApplyField]);
  }

  void delWhyChange(){
    HomeWorkApplyField homeWorkApplyField = state!.homeWorkFields![0].copyWith(selectList: []);
    state = state!.copyWith(homeWorkFields: [homeWorkApplyField]);
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

  void delServiceStartTime(){
    HomeWorkApplyField homeWorkApplyField = state!.homeWorkFields![2].copyWith(selectList: []);
    state = state!.copyWith(homeWorkFields: [state!.homeWorkFields![0], state!.homeWorkFields![1], homeWorkApplyField]);

  }

  void addHasPet(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "혹시 반려동물이 있으신가요?", selectList: ["예", "아니오"]);
    state = state!.copyWith(homeWorkFields: [...state!.homeWorkFields!, homeWorkApplyField]);
  }

  void addNotice(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "아래 버튼을 누르시면 예약변경이 진행됩니다.");
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

  void setCleaningDate(String value1, String value2, String value3, String value4, bool value5, int value6, int value7) {
    state = state?.copyWith(cleaningDate: CleaningDate(value1, value2, value3, value4, value5, value6, value7));
  }

  Future<void>
  reservationChange(ReservationUpdateDTO request) async {
    ResponseDTO responseDTO = await ReservationRepository().fetchReservationUpdate(request, ref.read(sessionProvider).jwt!);
    if(responseDTO.success == true){
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("변경 성공!"),
        ),
      );
      addWhyChange();
      ref.read(reservationProvider.notifier).fetchReservation();
      Navigator.pushNamedAndRemoveUntil(mContext!, Move.ReservationListPage, (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("변경 실패!"),
        ),
      );
    }
  }


}



// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final reservationChangeProvider =
StateNotifierProvider<ReservationChangePageViewModel, ReservationChangePageModel?>((ref) {
  return ReservationChangePageViewModel(ReservationChangePageModel([], CleaningDate("", "", "", "", false, 0, 1), 1), ref) ..addWhyChange();
});
