import 'package:intl/intl.dart';

class ReservationDetail {
  String address;
  String addressDetail;
  DateTime reservationDate;
  String reservationTime;
  bool pet;
  int price;
  String firstCategory;
  String secondCategory;
  String option;

  ReservationDetail(this.address, this.addressDetail, this.reservationDate, this.reservationTime,
      this.pet, this.price, this.secondCategory, this.firstCategory, this.option);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  ReservationDetail.fromJson(Map<String, dynamic> json)
      : address = json["address"],
        addressDetail = json["addressDetail"],
        reservationDate = DateTime.parse(json["reservationDate"]),
        reservationTime = json["reservationTime"],
        pet = json["pet"],
        price = json["price"],
        firstCategory = json["firstCategory"],
        secondCategory = json["secondCategory"],
        option = json["option"];

  @override
  String toString() {
    return 'ReservationDetail{address: $address, addressDetail: $addressDetail, reservationDate: $reservationDate, reservationTime: $reservationTime, pet: $pet, price: $price, firstCategory: $firstCategory, secondCategory: $secondCategory, option: $option}';
  }

  String getFormattedDate() {
    return DateFormat("M월 d일").format(reservationDate);
  }

  String getFormattedTime() {
    final timeFormat = DateFormat('HH:mm:ss');
    final time = timeFormat.parse(reservationTime);

    final ampmFormat = DateFormat('a h시');
    return ampmFormat.format(time);
  }
}