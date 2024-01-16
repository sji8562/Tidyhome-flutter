class ReservationResult {
  String reservationDate;
  String reservationTime;
  bool pet;
  String address;
  String addressDetail;
  String optionName;

  ReservationResult(this.reservationDate, this.reservationTime, this.pet,
      this.address, this.addressDetail, this.optionName);

  ReservationResult.fromJson(Map<String, dynamic> json)
      : reservationDate = json["reservationDate"],
        reservationTime = json["reservationTime"],
        pet = json["pet"],
        address = json["address"],
        addressDetail = json["addressDetail"],
        optionName = json["optionName"];
}

