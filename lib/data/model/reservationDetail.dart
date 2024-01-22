import 'package:intl/intl.dart';

class ReservationDetail {
  int reservationId;
  int status;
  String address;
  String addressDetail;
  String reservationDate;
  String reservationTime;
  bool pet;
  String enter;
  String enterPassword;
  String special;
  String otherRequest;
  int price;
  String firstCategory;
  String secondCategory;
  String option;


  ReservationDetail(
      this.reservationId,
      this.status,
      this.address,
      this.addressDetail,
      this.reservationDate,
      this.reservationTime,
      this.pet,
      this.enter,
      this.enterPassword,
      this.special,
      this.otherRequest,
      this.price,
      this.firstCategory,
      this.secondCategory,
      this.option);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  ReservationDetail.fromJson(Map<String, dynamic> json)
      : reservationId = json["reservationId"],
        status = json["status"] ?? 2,
        address = json["address"] ?? "",
        addressDetail = json["addressDetail"] ?? "",
        reservationDate = json["reservationDate"] ?? "",
        reservationTime = json["reservationTime"] ?? "",
        pet = json["pet"] ?? false,
        enter = json["enter"] ?? "",
        enterPassword = json["enterPassword"] ?? "",
        special = json["special"] ?? "",
        otherRequest = json["otherRequest"] ?? "",
        price = json["price"],
        firstCategory = json["firstCategory"],
        secondCategory = json["secondCategory"],
        option = json["option"];

  @override
  String toString() {
    return 'ReservationDetail{address: $address, addressDetail: $addressDetail, reservationDate: $reservationDate, reservationTime: $reservationTime, pet: $pet, price: $price, firstCategory: $firstCategory, secondCategory: $secondCategory, option: $option, status: $status, enter: $enter, enterPassword: $enterPassword, special: $special, otherRequest: $otherRequest}';
  }


  // String getFormattedDateWithYear() {
  //   return DateFormat("yyyy년 M월 d일").format(reservationDate);
  // }
  //
  // String getFormattedDate() {
  //   return DateFormat("M월 d일").format(reservationDate);
  // }

  String getFormattedTime() {
    final timeFormat = DateFormat('HH:mm:ss');
    final time = timeFormat.parse(reservationTime);

    final ampmFormat = DateFormat('H시');
    return ampmFormat.format(time);
  }

  String getFormattedPrice() {
    // "#,###" 형식으로 숫자 포맷을 설정합니다.
    final format = NumberFormat("#,###", "ko_KR");

    // 숫자를 포맷에 맞게 문자열로 변환합니다.
    String formattedPrice = format.format(price);

    // "원"을 추가합니다.
    formattedPrice += "원";

    return formattedPrice;
  }
}