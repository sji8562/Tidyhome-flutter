import 'package:intl/intl.dart';

class Reservation {
  int reservationId;
  DateTime reservationDate;
  String reservationTime;
  String firstCategory;
  int? status;

  Reservation(this.reservationId, this.reservationDate, this.reservationTime, this.firstCategory, this.status);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  Reservation.fromJson(Map<String, dynamic> json)
      : reservationId = json["reservationId"],
        reservationDate = DateTime.parse(json["reservationDate"]),
        reservationTime = json["reservationTime"],
        firstCategory = json["firstCategory"],
        status = json["status"];

  @override
  String toString() {
    return 'Reservation{reservationId: $reservationId, reservationDate: $reservationDate, reservationTime: $reservationTime, firstCategory: $firstCategory, status: $status';
  }

// Formatted date for data binding
  String getFormattedDate() {
    return DateFormat("M월 d일").format(reservationDate);
  }

  // Convert reservationTime to AM/PM format
  String getFormattedTime() {
    final timeFormat = DateFormat('HH:mm:ss');
    final time = timeFormat.parse(reservationTime);

    final ampmFormat = DateFormat('a h시');
    return ampmFormat.format(time);
  }
}