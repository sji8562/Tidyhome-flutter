import 'package:intl/intl.dart';

class Reservation {
  int reservationId;
  String reservationDate;
  String reservationTime;
  String firstCategory;

  Reservation(this.reservationId, this.reservationDate, this.reservationTime, this.firstCategory);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  Reservation.fromJson(Map<String, dynamic> json)
      : reservationId = json["reservationId"],
        reservationDate = json["reservationDate"],
        reservationTime = json["reservationTime"],
        firstCategory = json["firstCategory"];

  @override
  String toString() {
    return 'Reservation{reservationId: $reservationId, reservationDate: $reservationDate, reservationTime: $reservationTime, firstCategory: $firstCategory';
  }

// Formatted date for data binding
//   String getFormattedDate() {
//     return DateFormat("M월 d일").format(reservationDate);
//   }

  // Convert reservationTime to AM/PM format
  String getFormattedTime() {
    final timeFormat = DateFormat('HH:mm:ss');
    final time = timeFormat.parse(reservationTime);

    final ampmFormat = DateFormat('a h시');
    return ampmFormat.format(time);
  }
}