import 'package:intl/intl.dart';

class JoinReqDTO {
  final String tel;
  final int level;

  JoinReqDTO({required this.tel,
    required this.level,
  });

  Map<String, dynamic> toJson() =>
      {
        "tel": tel,
        "level": level
      };
}

class LoginReqDTO {
  final String userId;
  final String userPassword;

  LoginReqDTO({required this.userId, required this.userPassword});

  Map<String, dynamic> toJson() =>
      {"userId": userId, "userPassword": userPassword};
}

