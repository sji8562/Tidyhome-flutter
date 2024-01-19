import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../widget/button/soft_color_red_button.dart';
import '../account_closure_page_view_model.dart';

class AccountColumn extends ConsumerWidget {
  const AccountColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('탈퇴 요청',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SizedBox(height: gap_l,),
        Text('타이디홈 이용에 불편함 점이 있으셨다면 상담을 통해 말씀 해주세요.'
            ' 도움드릴 수 있도록 노력하겠습니다.'),
        SizedBox(height: gap_l,),
        Container(
          alignment: Alignment.centerLeft,
          child: Text('요청 전 다음을 확인해 주세요.\n'
              '- 별도의 안내 없이 7일 내 탈퇴 처리됩니다\n'
              '- 진행 중인 예약, 민원, 미납금이 없어야 합니다.\n'
              '- 적립금, 예치금, 쿠폰 등 모든 혜택이 사라집니다.\n'
          ),
        ),
        const SizedBox(height: 30,),
        SoftColorRedButton(text: '탈퇴 요청하기', funPageRoute: () {
          ref.read(accountClosureProvider).accountClose();
        }),
      ],
    );
  }
}
