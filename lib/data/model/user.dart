class User {
  String id;
  String tel;
  String level;

  User({required this.id, required this.tel, required this.level});

Map<String, dynamic> toJson() => {
  "id": id,
  "tel": tel,
  "level": level
};

User.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      tel = json["tel"],
      level = json["level"];

@override
String toString() {
return 'User{tel: $tel, level: $level}';
}

}
