class ReservationUpdateDTO {
  int id;
  String reservationDate;
  String reservationTime;

  ReservationUpdateDTO(this.id, this.reservationDate, this.reservationTime);

  Map<String, dynamic> toJson() =>
      {"reservationDate": reservationDate, "reservationTime": reservationTime};
}

class EnterAccessUpdateDTO {
  int reservationId;
  String enter;
  String password;

  EnterAccessUpdateDTO(this.reservationId, this.enter, this.password);

  Map<String, dynamic> toJson() =>
      {"enter": enter, "password": password};

}

class OtherRequestUpdateDTO {
  int reservationId;
  String special;
  String otherRequest;

  OtherRequestUpdateDTO(this.reservationId, this.special, this.otherRequest);

  Map<String, dynamic> toJson() =>
      {"special": special, "otherRequest": otherRequest};
}