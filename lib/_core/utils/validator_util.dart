
import 'package:validators/validators.dart';

String? validateGubun(String? value) {
  if (value == null || value.isEmpty) {
    return "공백 값이 들어갈 수 없습니다.";
  } else if (value != "청소업체" && value != "이용자") {
    return "'청소업체' 또는 '이용자'로 입력";
  }
  return null; // 유효성 검사 통과
}

String? validateTel(String? value) {
  if (value == null || value.isEmpty) {
    return "공백 값이 들어갈 수 없습니다.";
  } else if (!RegExp(r'^\d{3}-\d{4}-\d{4}$').hasMatch(value)) {
    return "올바른 전화번호 형식이 아닙니다. (예: 010-2345-1203)";
  }
  return null; // 유효성 검사 통과
}

String? validateAuthNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "공백 값이 들어갈 수 없습니다.";
  } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
    return "올바른 형식의 인증번호가 아닙니다. (숫자 6자리)";
  }
  return null; // 유효성 검사 통과
}

String? validatePassword(String? value) {
  String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+= ])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,20}$';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return "패스워드 공백이 들어갈 수 없습니다.";
  } else if (value.length > 21) {
    return "패스워드의 길이를 초과하였습니다.";
  } else if (value.length < 8) {
    return "패스워드의 최소 길이는 8자입니다.";
  }else if(!regExp.hasMatch(value)){
    return '특수문자, 대소문자, 숫자 포함 8자 이상 20자 이내로 입력하세요.';
  }
  return null; // 유효성 검사 통과
}

String? validatePasswordChk(String? value) {
  String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+= ])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,20}$';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return "패스워드 공백이 들어갈 수 없습니다.";
  } else if (value.length > 21) {
    return "패스워드의 길이를 초과하였습니다.";
  } else if (value.length < 8) {
    return "패스워드의 최소 길이는 8자입니다.";
  }else if(!regExp.hasMatch(value)){
    return '특수문자, 대소문자, 숫자 포함 8자 이상 20자 이내로 입력하세요.';
  }
  return null; // 유효성 검사 통과
}
// bool arePasswordsEqual(String? password, String? passwordChk) {
//   // 두 값이 모두 유효하고 서로 같은지 확인
//
//   return validatePassword(password) == null &&
//       validatePasswordChk(passwordChk) == null &&
//       password == passwordChk;
// }

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "이메일은 공백이 들어갈 수 없습니다.";
  } else if (!isEmail(value)) {
    return "이메일 형식에 맞지 않습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validateTitle(String? value) {
  if (value == null || value.isEmpty) {
    return "제목은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 30) {
    return "제목의 길이를 초과하였습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validateContent(String? value) {
  if (value == null || value.isEmpty) {
    return "내용은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 500) {
    return "내용의 길이를 초과하였습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "내용은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 500) {
    return "내용의 길이를 초과하였습니다.";
  }else if(!isNumeric(value)){
    return "숫자만 입력가능합니다.";
  }
  return null; // 유효성 검사 통과
}
String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return "내용은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 20) {
    return "내용의 길이를 초과하였습니다.";
  }
  return null; // 유효성 검사 통과
}
String? validateCardName(String? value) {
  // if (value == null || value.isEmpty) {
  //   return "내용은 공백이 들어갈 수 없습니다.";
  // } else if (value.length > 500) {
  //   return "내용의 길이를 초과하였습니다.";
  // }
  return null; // 유효성 검사 통과
}
String? validateCardNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "내용은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 17) {
    return "내용의 길이를 초과하였습니다.";
  }else if(!isNumeric(value)){
    return "숫자만 입력해주세요";
  }

  return null; // 유효성 검사 통과
}

String? validatePinNumber(String? value) {
  // if (value == null || value.isEmpty) {
  //   return "내용은 공백이 들어갈 수 없습니다.";
  // } else if (value.length > 500) {
  //   return "내용의 길이를 초과하였습니다.";
  // }
  return null; // 유효성 검사 통과
}

// KWON
String? validateAccountClosureReason(String? value) {
  if (value == null) {
    return null;
  } else if (value.length > 500) {
    return "내용의 길이를 초과하였습니다.";
  }

  return null; // 유효성 검사 통과
}

String? validateEnterMethod(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (value.length > 20) {
    return "길이를 초과하였습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validateOthers(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (value.length > 150) {
    return "길이를 초과하였습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validateArea(String? value) {
  if (value == null || value.isEmpty) {
    return "공백 값이 들어갈 수 없습니다.";
  }

  // 정규 표현식을 사용하여 1부터 1000까지의 숫자인지 확인
  RegExp regExp = RegExp(r'^([1-9]|[1-9]\d{0,2}|1000)$');
  if (!regExp.hasMatch(value)) {
    return "1부터 1000까지의 숫자만 입력해주세요.";
  }

  return null; // 유효성 검사 통과
}