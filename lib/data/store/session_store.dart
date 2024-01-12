import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/ui/pages/join_page/join_page_view_model.dart';

import '../../_core/constants/http.dart';
import '../../_core/constants/move.dart';
import '../../main.dart';
import '../dto/request_dto/user/user_request.dart';
import '../dto/response_dto/response_dto.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

// 1. 창고 데이터
class SessionUser {
  User? user;
  String? jwt;
  bool isLogin;

  SessionUser({this.user, this.jwt, this.isLogin = false});
}

// 2. 창고
class SessionStore extends SessionUser {
  // 1. 화면 context에 접근하는 법
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SessionStore(this.ref);

  void setUser(){
    this.user = User(1, "1234");
    this.jwt = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0b2sta2V5IiwiaWQiOjEsInRlbCI6IjEyMzQiLCJleHAiOjE3MjM3Nzk5NDB9.y43ng2W_NWFqOyeIHvh2oMSI6SSPvvaUXt1CeWM9XdOXfqCve3WAc2XnRwg3Snc4yjI3JA4FO6SIVkpgFIhFQg";
    this.isLogin = true;
  }



  Future<void> join(JoinReqDTO joinReqDTO) async {
    Logger().d("여기까지 실행됨");
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    Logger().d("여기까지 실행됨1");

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      Logger().d("응답: 성공");
      Navigator.pushNamed(mContext!, Move.MainPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }

  Future<void> login(JoinReqDTO joinReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(joinReqDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      // 1. 세션값 갱신
      Logger().d("세션값 갱신 진입");
      Logger().d(responseDTO.response);
      this.user = responseDTO.response as User;
      this.jwt = responseDTO.token;
      this.isLogin = true;
      Logger().d("세션값 갱신 완료");
      // 2. 디바이스에 JWT 저장 (자동 로그인)
      await secureStorage.write(key: "jwt", value: responseDTO.token);
      Logger().d("여기까지 실행됨");
      // 3. 페이지 이동
      Navigator.pushNamed(mContext!, Move.StartPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error!)));
    }
  }

  // JWT는 로그아웃할 때 서버측으로 요청할 필요가 없음.
  Future<void> logout() async {
    Logger().d("로그아웃 테스트10");

    this.jwt = null;
    this.isLogin = false;
    this.user = null;
    Logger().d("로그아웃 테스트11");

    await secureStorage.delete(key: "jwt");
    Logger().d("로그아웃 테스트12");
    Navigator.pushNamedAndRemoveUntil(
        mContext!, Move.StartPage, (route) => false);
  }

  // sms 발송
  Future<void> smsSend(JoinReqDTO joinReqDTO) async {
    // 1. 통신 코드
    Logger().d("sms발송 응답요청");
    ResponseDTO responseDTO = await UserRepository().fetchSmsSend(joinReqDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("발송 완료!"),
        ),
      );
      JoinChatModel? joinChatModel = ref.read(joinChatProvider);
      if (joinChatModel!.joinFields.length > 2) {
        return;
      } else if (joinChatModel!.joinFields.length == 2) {
        ref.read(joinChatProvider.notifier).addAuthInfo();
      }
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("발송 실패!"),
        ),
      );
    }
  }

  //sms 인증검사
  Future<void> smsCheck(SmsCheckDTO smsCheckDTO) async {
    // 1. 통신 코드
    Logger().d("sms 인증 로직 진입");
    ResponseDTO responseDTO = await UserRepository().fetchSmsCheck(smsCheckDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("인증 성공!"),
        ),
      );
      await login(JoinReqDTO(tel: smsCheckDTO.tel));
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("인증 실패!"),
        ),
      );
    }
  }
}

// 3. 창고 관리자
final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore(ref);
});
