import 'package:intl/intl.dart';

class Notice {
  int id;
  String title;
  String content;
  String createdAt;

  Notice(this.id, this.title, this.content, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  Notice.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"],
        createdAt = json["createdAt"];

  @override
  String toString() {
    return 'Notice{id:$id, title: $title, content: $content, createdAt: $createdAt}';
  }
}