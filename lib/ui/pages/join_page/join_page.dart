import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/utils/validator_util.dart';
import 'package:toyproject/data/dto/request_dto/user/user_request.dart';
import 'package:toyproject/data/model/JoinField.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/join_page/join_page_view_model.dart';
import 'package:toyproject/ui/widget/text_form_field/common_text_form_field.dart';
import 'package:toyproject/ui/widget/text_form_field/custom_text_form_field.dart';

import 'widget/join_text_form_field.dart';

class JoinPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _gubunControllers = [];

  JoinPage({Key? key}) : super(key: key);

  //유효성 검사 항목을 index에 따라 동적으로 선택하는 함수
  Function? getDynamicValidator(int index) {
    if (index == 0) {
      return validateGubun;
    } else if (index == 1){
      return validateTel;
    } else if (index == 2){
      return validateAuthNumber;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinChatModel? joinChatModel = ref.watch(joinChatProvider);
    SessionStore sessionStore = ref.read(sessionProvider);
    //null 처리 : 상태값이 null일 경우, gif가 출력됨
    if (joinChatModel?.joinFields == null) {
      return Center(
        child: Image.asset('assets/images/giphy.gif', fit: BoxFit.cover, width: 200, height: 200),
      );
    }
    List<JoinField> joinFields = joinChatModel!.joinFields;

    return Scaffold(
      backgroundColor: formColor,
      body: Form(
        key: _formKey,
        child: ListView.builder(
          itemCount: joinFields.length,
          itemBuilder: (context, index) {
            // 컨트롤러 초기화
            if (index >= _gubunControllers.length) {
              _gubunControllers.add(TextEditingController());
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    width: 250,
                    decoration: BoxDecoration(
                      color: basicColorW,
                      border: Border.all(width: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(joinFields[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(joinFields[index].description ?? "", style: TextStyle(color: basicColorB9)),
                        SizedBox(height: 15),
                        Divider(
                          color: disableColor,
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: JoinTextFormField(
                                funValidator: getDynamicValidator(index),
                                placeholderText: joinFields[index].placeholder,
                                controller: _gubunControllers[index],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if(index == 0) {
                                  //첫번째 요소에 대한 답변 업데이트
                                  ref.read(joinChatProvider.notifier).updateAnswer(index, _gubunControllers[index].text);
                                  //다음 입력폼 요소 출력 지연 시간 설정
                                  Future.delayed(Duration(seconds: 1), () {
                                  ref.read(joinChatProvider.notifier).addUserTel();
                                }); }
                                if(index == 1) {
                                  //두번째 요소에 대한 답변 업데이트
                                  ref.read(joinChatProvider.notifier).updateAnswer(index, _gubunControllers[index].text);
                                  //다음 입력폼 요소 출력 지연 시간 설정
                                  Future.delayed(Duration(seconds: 1), () {
                                     ref.read(joinChatProvider.notifier).addAuthInfo();
                                });}
                                if(index == 2) {
                                  //세번째 요소에 대한 답변 업데이트
                                  ref.read(joinChatProvider.notifier).updateAnswer(index, _gubunControllers[index].text);
                                  //회원가입 & 로그인 처리
                                  int level = 0;
                                  Future.delayed(Duration(seconds: 1), () {
                                    if(joinFields[0].inputGubun == "청소업체"){
                                        level = 1;
                                    };
                                    JoinReqDTO joinReqDTO = JoinReqDTO(tel: joinFields[1].inputTel!, level: level);
                                    sessionStore.join(joinReqDTO);
                                  });
                                }
                              },
                              child: Container(
                                child: Text("확인", style: TextStyle(color: primaryColor)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (joinFields[index].inputGubun != null && index == 0)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 120,
                          decoration: BoxDecoration(
                            color: basicColorW,
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(joinFields[index].inputGubun!),
                        ),
                      ),
                    ),
                  if (joinFields[index].inputTel != null && index == 1)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 120,
                          decoration: BoxDecoration(
                            color: basicColorW,
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(joinFields[index].inputTel!),
                        ),
                      ),
                    ),
                  if (joinFields[index].inputAuthNumber != null && index == 2)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 120,
                          decoration: BoxDecoration(
                            color: basicColorW,
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(joinFields[index].inputAuthNumber!),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
