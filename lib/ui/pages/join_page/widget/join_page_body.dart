import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/utils/validator_util.dart';
import '../../../../data/dto/request_dto/user/user_request.dart';
import '../../../../data/model/JoinField.dart';
import '../../../../data/store/session_store.dart';
import '../join_page_view_model.dart';
import 'join_text_form_field.dart';

class JoinPageBody extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _gubunControllers = [];
  final List<FocusNode> _gubunFocusNodes = [];

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

  String? getDynamicValidatorName(int index, value) {
    if (index == 0) {
      return validateGubun(value);
    } else if (index == 1){
      return validateTel(value);
    } else if (index == 2){
      return validateAuthNumber(value);
    }
    return "";
  }
  JoinPageBody({super.key});

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
    bool resendVisible = false;
    return Form(
      key: _formKey,
      child: ListView.builder(
        itemCount: joinFields.length,
        itemBuilder: (context, index) {
          _gubunControllers.addAll(List.generate(3, (_) => TextEditingController()));
          // 포커스 노드 초기화
          _gubunFocusNodes.addAll(List.generate(3, (_) => FocusNode()));

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
                      //텍스트 폼 필드 시작
                      if(!joinFields[index].resendVisible)
                        Row(
                          children: [
                            Expanded(
                              child: JoinTextFormField(
                                //유효성 검사 여부에 따라 IsValidated 값을 true, false 로 변경함, onTap기능을 활성화/비활성화하는데 사용
                                changeFormData: (value){
                                  if (value.isEmpty) {
                                    resendVisible = true;
                                  } else {
                                    resendVisible = false;
                                  }
                                  if(getDynamicValidatorName(index, value) == null){
                                    ref.read(joinChatProvider.notifier).changeIsValidated(index);
                                  } else if(joinFields[index].isValidated == true && getDynamicValidatorName(index, value) != null){
                                    ref.read(joinChatProvider.notifier).changeIsValidated(index);
                                  }
                                },
                                focusNode: _gubunFocusNodes[index],
                                funValidator: getDynamicValidator(index),
                                placeholderText: joinFields[index].placeholder,
                                controller: _gubunControllers[index],
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  if(index == 0) {
                                    //유효성 검사가 되지 않으면 클릭되지 않도록 막음
                                    if(!joinFields[index].isValidated){
                                      return;
                                    }
                                    //첫번째 요소에 대한 답변 업데이트
                                    ref.read(joinChatProvider.notifier).updateAnswer(index, _gubunControllers[index].text);
                                    //다음 입력폼 요소 출력 지연 시간 설정
                                    Future.delayed(Duration(seconds: 1), () {
                                      ref.read(joinChatProvider.notifier).addUserTel();
                                    }); }
                                  if(index == 1) {
                                    //유효성 검사가 되지 않으면 클릭되지 않도록 막음
                                    if(!joinFields[index].isValidated){
                                      return;
                                    }
                                    //두번째 요소에 대한 답변 업데이트
                                    ref.read(joinChatProvider.notifier).updateAnswer(index, _gubunControllers[index].text);
                                    //다음 입력폼 요소 출력 지연 시간 설정
                                    Future.delayed(Duration(seconds: 1), () {
                                      ref.read(joinChatProvider.notifier).changeResendVisible(index, true);
                                      JoinReqDTO joinReqDTO = JoinReqDTO(tel: _gubunControllers[index].text);
                                      sessionStore.smsSend(joinReqDTO);
                                    });}
                                  if(index == 2) {
                                    //유효성 검사가 되지 않으면 클릭되지 않도록 막음
                                    if(!joinFields[index].isValidated){
                                      return;
                                    }
                                    //세번째 요소에 대한 답변 업데이트
                                    ref.read(joinChatProvider.notifier).updateAnswer(index, _gubunControllers[index].text);
                                    //회원가입 & 로그인 처리
                                    int level = 0;
                                    Future.delayed(Duration(seconds: 1), () {
                                      // if(joinFields[0].inputGubun == "청소업체"){
                                      //     level = 1;
                                      // };

                                      SmsCheckDTO smsCheckDTO = SmsCheckDTO(tel: joinFields[1].inputTel!, code: _gubunControllers[index].text);
                                      sessionStore.smsCheck(smsCheckDTO);
                                    });
                                  }
                                },
                                child: Container(
                                  child: Text(
                                    "확인",
                                    style: TextStyle(
                                      color: joinFields[index].isValidated ? primaryColor : disableColor,//
                                    ),
                                  ),
                                ))],
                        ),
                      if(joinFields[index].resendVisible && (index == 1))
                        InkWell(onTap: (){
                          ref.read(joinChatProvider.notifier).changeResendVisible(index, false);
                        },child: Container(alignment: const Alignment(-1,0), height: 60,child: const Text("전화번호 재입력 >", style: TextStyle(color: primaryColor, fontSize: 14),)),),
                      if(!joinFields[index].resendVisible && (index == 2))
                        InkWell(onTap: (){
                          JoinReqDTO joinReqDTO = JoinReqDTO(tel: joinFields[1].inputTel!);
                          sessionStore.smsSend(joinReqDTO);
                        },child: Container(alignment: const Alignment(-1,0), height: 60,child: const Text("인증번호 재발송 >", style: TextStyle(color: primaryColor, fontSize: 14),)),)
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
    );
  }
}
