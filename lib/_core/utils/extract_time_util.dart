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
