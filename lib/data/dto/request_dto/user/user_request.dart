import 'package:intl/intl.dart';

class JoinReqDTO {
  final String tel;

  JoinReqDTO({required this.tel,
  });

  Map<String, dynamic> toJson() =>
      {
        "tel": tel
      };
}

class LoginReqDTO {
  final String userId;
  final String userPassword;

  LoginReqDTO({required this.userId, required this.userPassword});

  Map<String, dynamic> toJson() =>
      {"userId": userId, "userPassword": userPassword};
}

class SmsCheckDTO {
  final String tel;
  final String code;

  SmsCheckDTO({required this.tel, required this.code});

  Map<String, dynamic> toJson() =>
      {"tel": tel, "code": code};
}

class PartnerUpdateDTO {
  final int id;
  final String userName;
  final String businessNumber;
  final String picUrl;

  PartnerUpdateDTO(this.id, this.userName, this.businessNumber, this.picUrl);

  Map<String, dynamic> toJson() =>
      {"id": id, "userName": userName, "businessNumber": businessNumber, "picUrl": picUrl};

}

