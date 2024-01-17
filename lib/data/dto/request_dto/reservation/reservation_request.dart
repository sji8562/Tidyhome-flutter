class ReservationUpdateDTO {
  int id;
  String reservationDate;
  String reservationTime;

  ReservationUpdateDTO(this.id, this.reservationDate, this.reservationTime);

  Map<String, dynamic> toJson() =>
      {"reservationDate": reservationDate, "reservationTime": reservationTime};
}