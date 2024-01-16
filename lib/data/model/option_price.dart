class OptionPrice {
  int id;
  String name;
  int price;

  OptionPrice(this.id, this.name, this.price);


  OptionPrice.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        price = json["price"];
}