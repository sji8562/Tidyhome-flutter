import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/utils/extract_time_util.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/option_price.dart';
import 'package:toyproject/data/repository/option_repository.dart';
import 'package:toyproject/data/store/session_store.dart';

import '../../../../../data/model/home_work_apply_field.dart';

// 1. 창고 데이터
class MovingCleaningApplyPageModel  {
  List<HomeWorkApplyField>? homeWorkFields;
  List<OptionPrice>? options;
  MovingCleaningApplyPageModel(this.homeWorkFields, this.options);

  MovingCleaningApplyPageModel copyWith({
    List<HomeWorkApplyField>? homeWorkFields,
    List<OptionPrice>? options
  }) {
    return MovingCleaningApplyPageModel(
      homeWorkFields ?? this.homeWorkFields,
      options ?? this.options
    );
  }


}

// 2. 창고
class MovingCleaningApplyPageViewModel extends StateNotifier<MovingCleaningApplyPageModel?> {
  Ref ref;
  MovingCleaningApplyPageViewModel(super.state, this.ref);

  Future<void> roadOptions() async {
    ResponseDTO responseDTO = await OptionRepository().fetchOptionList(2, ref.read(sessionProvider)!.jwt!);
    state = state!.copyWith(options: responseDTO.response);
    addServiceTime();
  }

  void addServiceTime() {
    List<String> selectList = state!.options!.map((option) {
      return '${option.name} / ${formatNumberWithComma(option.price)}원';
    }).toList();
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "서비스 시간은 얼마나 필요하신가요?", selectList: selectList);
    state = state!.copyWith(homeWorkFields: [homeWorkApplyField]);
  }

  void delServiceTime(){
    HomeWorkApplyField homeWorkApplyField = state!.homeWorkFields![0].copyWith(selectList: []);
    state = state!.copyWith(homeWorkFields: [homeWorkApplyField]);
  }

  void addAreaSize(){
    HomeWorkApplyField homeWorkApplyField = HomeWorkApplyField(question: "분양(공급)면적을 알려주세요.", selectList: []);
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
    HomeWorkApplyField homeWorkApplyField = state!.homeWorkFields![3].copyWith(selectList: []);
    state = state!.copyWith(homeWorkFields: [state!.homeWorkFields![0], state!.homeWorkFields![1], state!.homeWorkFields![2], homeWorkApplyField]);
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
final movingCleaningApplyProvider =
StateNotifierProvider<MovingCleaningApplyPageViewModel, MovingCleaningApplyPageModel?>((ref) {
  return MovingCleaningApplyPageViewModel(MovingCleaningApplyPageModel([], []), ref)..roadOptions();
});
