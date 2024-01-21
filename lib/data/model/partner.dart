class Partner {
  int? id;
  String? tel;
  String? username;
  String? picUrl;
  String? categoryId;
  String? location;
  String? businessNumber;
  int? level;

  Partner(this.id, this.tel, this.username, this.picUrl, this.categoryId,
      this.location, this.businessNumber, this.level);

  Partner.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        tel = json["tel"];
}