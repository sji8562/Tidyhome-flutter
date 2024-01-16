class PaymentRequestDTO {
  int addressInfoId;
  int optionId;
  String reservationDate;
  String reservationTime;
  bool pet;


  PaymentRequestDTO(this.addressInfoId, this.optionId, this.reservationDate,
      this.reservationTime, this.pet);

  Map<String, dynamic> toJson() => {
    "addressInfoId": addressInfoId,
    "optionId": optionId,
    "reservationDate": reservationDate,
    "reservationTime": reservationTime,
    "pet": pet,
  };
}