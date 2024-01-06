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
    try {
      Response<dynamic> response =
      await dio.post("/api/users/join", data: requestDTO.toJson());
      Logger().d("회원가입 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = User.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "중복된 유저명입니다.");
    }
  }

//  로그인
  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      Logger().d("fetchLogin요청됨");
      Response<dynamic> response = await dio.post<dynamic>("/api/users/login",
          data: requestDTO.toJson());

      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("파싱완료1");
      responseDTO.response = User.fromJson(responseDTO.response);
      Logger().d("파싱완료2");

      final jwt = response.headers["Authorization"];

      if (jwt != null) {
        responseDTO.token = jwt.first;
      }
      Logger().d("jwt토큰 넣기");
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "로그인실패.");
    }
  }
}
