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
    JoinField joinField = JoinField(title: "청소업체이신가요? 사용자이신가요?", description: "'청소업체' 또는 '사용자'로 응답", arrowTitle: "");
    state = state?.copyWith(
      joinFields: [...state!.joinFields, joinField],
    );
  }
  void addUserTel() {
    JoinField joinField = JoinField(title: "전화번호를 입력해주세요", description: "서비스 시작을 위해 처음 한 번 전화번호 인증이 필요합니다.", arrowTitle: "전화번호 재입력");
    state = state?.copyWith(
      joinFields: [...state!.joinFields, joinField],
    );
  }
  void addAuthInfo() {
    JoinField joinField = JoinField(title: "인증번호를 입력해주세요", description: "서비스 시작을 위해 처음 한 번 전화번호 인증이 필요합니다.", arrowTitle: "인증번호 재발송");
    state = state?.copyWith(
      joinFields: [...state!.joinFields, joinField],
    );
  }

}

// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final joinChatProvider =
StateNotifierProvider<JoinChatViewModel, JoinChatModel?>((ref) {
  return JoinChatViewModel(JoinChatModel([]))..addUserGubun();
});
