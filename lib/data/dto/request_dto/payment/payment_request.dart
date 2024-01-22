class PaymentRequestDTO {
  int addressInfoId;
  int optionId;
  String reservationDate;
  String reservationTime;
  bool pet;
  String enter;
  String enterPassword;
  String special;
  String otherRequest;
  int status;


  PaymentRequestDTO(
      this.addressInfoId,
      this.optionId,
      this.reservationDate,
      this.reservationTime,
      this.pet,
      this.enter,
      this.enterPassword,
      this.special,
      this.otherRequest,
      this.status);

  Map<String, dynamic> toJson() => {
    "addressInfoId": addressInfoId,
    "optionId": optionId,
    "reservationDate": reservationDate,
    "reservationTime": reservationTime,
    "pet": pet,
    "enter": enter,
    "enterPassword": enterPassword,
    "special": special,
    "otherRequest": otherRequest,
    "status": status
  };
}