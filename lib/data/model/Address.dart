
import 'package:toyproject/data/model/user.dart';

class Address {
  final int id;
  final String address;
  final String addressDetail;
  final bool choice;
  bool? isChecked;


  Address(
      this.id, this.address, this.addressDetail, this.choice);

  Address copyWith({
    int? id,
    String? address,
    String? addressDetail,
    bool? choice,
    bool? isChecked,
  }) {
    return Address(
      id ?? this.id,
      address ?? this.address,
      addressDetail ?? this.addressDetail,
      choice ?? this.choice,
    )..isChecked = isChecked ?? this.isChecked;
  }

// Map 형태로 받아서 Dart 객체로 변환합니다.
  Address.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        address = json["address"],
        addressDetail = json["addressDetail"],
        choice = json["choice"] ?? false;

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "addressDetail": addressDetail,
    "choice": choice
  };
}
