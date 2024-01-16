int extractHour(String data) {
  // "시간" 이전의 문자열을 찾아 숫자를 추출하여 반환
  RegExp regex = RegExp(r'(\d+)\s*시간');
  Match? match = regex.firstMatch(data);

  if (match != null) {
    String hourString = match.group(1)!; // 정규식 그룹에서 숫자 추출
    return int.tryParse(hourString) ?? 0; // 정수로 변환, 실패하면 0 반환
  } else {
    return 0;
  }
}

String extractHoursToString(String input) {
  // 정규 표현식을 사용하여 '숫자 + 시간' 형태의 문자열을 찾습니다.
  RegExp regex = RegExp(r'(\d+시간)');
  Match? match = regex.firstMatch(input);

  // 매치된 부분이 있으면 해당 부분을 반환하고, 없으면 빈 문자열을 반환합니다.
  return match?.group(0) ?? '';
}

int extractPrice(String input) {
  // 정규 표현식을 사용하여 '숫자 + , + 숫자 + 원' 형태의 문자열을 찾습니다.
  RegExp regex = RegExp(r'(\d{1,3},\d+)원');
  Match? match = regex.firstMatch(input);

  // 매치된 부분이 있으면 `,`를 제거하고 해당 부분을 정수로 변환하여 반환하고, 없으면 0을 반환합니다.
  return match != null ? int.parse(match.group(1)!.replaceAll(',', '')) : 0;
}

int parseInt(String input) {
  try {
    return int.parse(input);
  } catch (e) {
    // 만약 변환 중 에러가 발생하면 기본값으로 0을 반환하거나, 에러를 처리할 수 있습니다.
    return 0;
  }
}

String formatNumberWithComma(int number) {
  return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},');
}
