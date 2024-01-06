import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../data/model/JoinField.dart';

// final counterProvider = ChangeNotifierProvider<JoinChatModel>((ref) {
//   return JoinChatModel();
// });

// final counterProvider = StateNotifierProvider<JoinChatViewModel, JoinChatModel?>((ref) {
//   return JoinChatViewModel();
// });

// 1. 창고 데이터
class JoinChatModel  {
  List<JoinField> joinFields;

  JoinChatModel(this.joinFields);

  JoinChatModel copyWith({
    List<JoinField>? joinFields,
  }) {
    return JoinChatModel(
      joinFields ?? this.joinFields,
    );
  }


}

// 2. 창고
class JoinChatViewModel extends StateNotifier<JoinChatModel?> {
  JoinChatViewModel(super.state);

  void addUserGubun() {
    JoinField joinField = JoinField(title: "청소업체이신가요? 사용자이신가요?",
        description: "회원 구분을 위해 정보가 필요합니다.",
        arrowTitle: "",
        placeholder: "청소업체 or 이용자");
    state = state?.copyWith(
      joinFields: [...state!.joinFields, joinField],
    );
  }

  void addUserTel() {
    JoinField joinField = JoinField(title: "전화번호를 입력해주세요",
        description: "서비스 시작을 위해 처음 한 번 전화번호 인증이 필요합니다.",
        arrowTitle: "전화번호 재입력",
        placeholder: "010-1234-5678");
    state = state?.copyWith(
      joinFields: [...state!.joinFields, joinField],
    );
  }

  void addAuthInfo() {
    JoinField joinField = JoinField(title: "인증번호를 입력해주세요",
        description: "서비스 시작을 위해 처음 한 번 전화번호 인증이 필요합니다.",
        arrowTitle: "인증번호 재발송",
        placeholder: "123456");
    state = state?.copyWith(
      joinFields: [...state!.joinFields, joinField],
    );
  }

  void updateAnswer(int index, String answer) {
    state = state?.copyWith(
      joinFields: state!.joinFields.asMap().map((i, joinField) {
        if (i == index && index == 0) {
          return MapEntry(i, joinField.copyWith(inputGubun: answer));
        } else if (i == index && index == 1){
          return MapEntry(i, joinField.copyWith(inputTel: answer));
        } else if (i == index && index == 2){
          return MapEntry(i, joinField.copyWith(inputAuthNumber: answer));
        } else {
          return MapEntry(i, joinField);
        }
      }).values.toList(),
    );
  }

}
// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final joinChatProvider =
StateNotifierProvider<JoinChatViewModel, JoinChatModel?>((ref) {
  return JoinChatViewModel(JoinChatModel([]))..addUserGubun();
});
