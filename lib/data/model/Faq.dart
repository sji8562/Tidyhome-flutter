import 'package:intl/intl.dart';

class Faq {
  int faqId;
  String name; // 1:결제/예약 2 : 개인정보/환경설정 3:가사도우미 4: 사무실청소 5: 이사청소 6: 가전침대 청소
  int partId;
  String title;
  String content;
  int code; // 1 서비스 이용, 2 서비스 요금

  Faq(this.faqId, this.name, this.partId, this.title, this.content, this.code); // Map 형태로 받아서 Dart 객체로 변환합니다.

  Faq.fromJson(Map<String, dynamic> json)
      : faqId = json["faqId"],
        name = json["name"],
        partId = json["partId"],
        title = json["title"],
        content = json["content"],
        code = json["code"];

  @override
  String toString() {
    return 'Faq{faqId: $faqId, name: $name, partId: $partId, title: $title, content: $content, code: $code}';
  } // Convert String to DateTime
}