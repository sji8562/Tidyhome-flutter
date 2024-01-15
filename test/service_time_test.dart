import 'package:toyproject/data/model/home_work_apply_field.dart';

void main() {
  print(addServiceStartTime(7));
}

String addServiceStartTime(int serviceHours) {
  // 시작 시간은 오전 9시
  int startHour = 9;

  // 결과 문자열
  String result = '';

  // 각 구간에 대해 반복
  for (int i = 0; i < (24 / serviceHours); i++) {
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
    result += "$timeOfDayStart $adjustedStartHour시 ~ $timeOfDayEnd $adjustedEndHour시, ";

    // 다음 구간의 시작 시간 설정
    startHour = endHour;

    // 종료 시간이 23시를 넘어가면 반복 종료
    if (endHour >= 23) {
      break;
    }
  }

  // 마지막에 추가된 쉼표 제거
  result = result.trim().replaceAll(RegExp(r',\s*$'), '');

  return result;
}
