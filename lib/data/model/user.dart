class User {
  int? id;
  String? tel;
  // String? createdAt;


  User(this.id, this.tel);

Map<String, dynamic> toJson() => {
  "id": id,
  "tel": tel,
};

User.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      tel = json["tel"];
      // createdAt = json["createdAt"];

@override
String toString() {
return 'User{id:$id,  tel: $tel}';
}

}
