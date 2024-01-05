import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/data/model/JoinField.dart';
import 'package:toyproject/ui/pages/join_page/join_page_view_model.dart';

class JoinPage extends ConsumerWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinChatModel? joinChatModel = ref.watch(joinChatProvider);
    if(joinChatModel?.joinFields == null) {
      return Center(child: Image.asset('assets/images/giphy.gif', fit: BoxFit.cover, width: 200, height: 200),);
    }
    List<JoinField> joinFields = joinChatModel!.joinFields;
    print("조인필드 테스트중입니다" + joinFields.toString());

    return Scaffold(
      backgroundColor: basicColorB9,
      body: ListView.builder(itemCount: joinFields.length ,itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Text(joinFields[index].title),
              Text(joinFields[index].description ?? ""),
              Divider(
                color: disableColor,
                height: 1, // 높이 조절
              )
              ,
            ],
          ),
        );
      },),
    );
  }
}
