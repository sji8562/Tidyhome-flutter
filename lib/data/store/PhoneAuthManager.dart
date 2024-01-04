import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 전화번호로 사용자를 인증하는 함수
  Future<String> verifyPhoneNumber(String phoneNumber) async {
    Completer<String> completer = Completer<String>();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        completer.complete(); // 완료 시점에 반환할 값이 없으므로 빈 문자열 반환
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification Failed: ${e.message}');
        completer.completeError(e.message as Object); // 에러 발생 시 에러 메시지 반환
      },
      codeSent: (String verificationId, int? resendToken) {
        completer.complete(verificationId); // 코드 전송 시 verificationId 반환
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completer.completeError('자동 검색 시간이 초과되었습니다.'); // 타임아웃 시 에러 반환
      },
    );
    return completer.future;
  }

  // 코드 입력 및 인증 완료 함수
  Future<void> signInWithPhoneNumber(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      print('인증이 성공적으로 완료되었습니다.');
    } catch (e) {
      print('인증 오류: $e');
    }
  }
}