import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/http.dart';

import '../dto/request_dto/user/user_request.dart';
import '../dto/response_dto/response_dto.dart';
import '../model/user.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class UserRepository {

//  회원가입
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    Logger().d("fetchJoin 진입");
    try {
      Response<dynamic> response =
      await dio.post("/api/users/join", data: requestDTO.toJson());
      Logger().d("회원가입 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = User.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "중복된 전화번호이거나, 서비스되지 않는 전화번호입니다.");
    }
  }

  // sms 인증
  Future<ResponseDTO> fetchSmsSend(JoinReqDTO requestDTO) async {
    Logger().d("fetchSmsSend 진입");
    try {
      Response<dynamic> response =
      await dio.post("/api/users/sms-send", data: requestDTO.toJson());
      Logger().d("sms 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = User.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "문자 발송 실패.");
    }
  }

  // sms 인증번호 검사
  Future<ResponseDTO> fetchSmsCheck(SmsCheckDTO requestDTO) async {
    Logger().d("fetchSmsSend 진입");
    try {
      Response<dynamic> response =
      await dio.post("/api/users/sms-check", data: requestDTO.toJson());
      Logger().d("sms 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "인증번호가 일치하지 않습니다.");
    }
  }



//  로그인
  Future<ResponseDTO> fetchLogin(JoinReqDTO requestDTO) async {
    try {
      Logger().d("fetchLogin요청됨");
      Response<dynamic> response = await dio.post<dynamic>("/api/users/login",
          data: requestDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("파싱완료1");
      responseDTO.response = User.fromJson(responseDTO.response);

      final jwt = response.headers["Authorization"];
      if (jwt != null) {
        responseDTO.token = jwt.first;
      }
      Logger().d("jwt토큰 넣기");

      // responseDTO.response = User.fromJson(responseDTO.response); //user객체가 들어가지만 null값이나옴
      Logger().d("파싱완료2");
      Logger().d(responseDTO.response);
      Logger().d("파싱완료3");


      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "로그인실패.");
    }
  }

  // 파트너 로그인
  Future<ResponseDTO> fetchPartnerLogin(JoinReqDTO requestDTO) async {
    try {
      Logger().d("fetchLogin요청됨");
      Response<dynamic> response = await dio.post<dynamic>("/api/partner/login",
          data: requestDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("파싱완료1");
      responseDTO.response = User.fromJson(responseDTO.response);

      final jwt = response.headers["Authorization"];
      if (jwt != null) {
        responseDTO.token = jwt.first;
      }
      Logger().d("jwt토큰 넣기");

      // responseDTO.response = User.fromJson(responseDTO.response); //user객체가 들어가지만 null값이나옴
      Logger().d("파싱완료2");
      Logger().d(responseDTO.response);
      Logger().d("파싱완료3");


      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "로그인실패.");
    }
  }

  // 회원 탈퇴
  Future<ResponseDTO> fetchCloseAccount() async {
    try {
      Logger().d("회원 탈퇴 호출");
      Response<dynamic> response = await dio.post("/api/users/delete"
          // , data: {"tel" : "1234"}
      );
      Logger().d("결과 ================ 1111111");
      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("결과 ================ 22222222222");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "회원 탈퇴 실패");
    }
  }

  // 파트너 업데이트
  Future<ResponseDTO> fetchPartnerUpdate(PartnerUpdateDTO request) async {
    try {
      Logger().d("fetchPartnerUpdate 요청됨");
      Response<dynamic> response = await dio.post<dynamic>("/api/partner/update",
          data: request.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("파싱완료1");

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "파트너 업데이트 실패");
    }
  }

}
