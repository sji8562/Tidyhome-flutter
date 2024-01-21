import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/ui/pages/customer_page/account_closure_page/account_closure_page_view_model.dart';

class ClosureModal extends ConsumerWidget {

  const ClosureModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return AlertDialog(
      title: Text("탈퇴 확인"),
      content: Text("정말 탈퇴하시겠습니까?", style: titleStyle2(),),
      actions: <Widget>[
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // 원하는 색상으로 변경
            ),
            onPressed: () {
              ref.read(accountClosureProvider).accountClose(); //창 닫기
            },
            child: Text("탈퇴", style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); //창 닫기
            },
            child: Text("취소", style: TextStyle(color: Colors.black),),
          ),
        ),
      ],
    );
  }
}
