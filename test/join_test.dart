import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/http.dart';
import 'package:toyproject/data/dto/request_dto/user/user_request.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';

void main() async {
  JoinReqDTO joinReqDTO = JoinReqDTO(tel: "010-0101-0202");
  await fetchJoin(joinReqDTO);}

Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
  Logger().d("fetchJoin 진입");
  Logger().d("==========");
  Logger().d(requestDTO.toJson());
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
