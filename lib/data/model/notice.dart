import 'package:intl/intl.dart';

class Notice {
  int id;
  String title;
  String content;
  DateTime createdAt;

  Notice(this.id, this.title, this.content, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  Notice.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"],
        createdAt = DateTime.parse(json["createdAt"]); // Convert String to DateTime

  // Formatted date for data binding
  String getFormattedDate() {
    return DateFormat("yyyy년 M월 d일").format(createdAt);
  }

  @override
  String toString() {
    return 'Notice{id:$id, title: $title, content: $content, createdAt: ${getFormattedDate()}}';
  }
}