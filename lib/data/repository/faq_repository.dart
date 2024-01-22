import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/http.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/Faq.dart';

import '../model/notice.dart';

class FaqRepository {
  // 공지사항 조회
  Future<ResponseDTO> fetchFaq(partId, String jwt) async {
    Logger().d("fetchFaq 진입");
    try {
      Response<dynamic> response =
      await dio.get("/api/faq/1/list/$partId", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }));
      Logger().d("자주 묻는 질문 리스트 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response;
      List<Faq> faqs = mapList.map((e) => Faq.fromJson(e)).toList();
      responseDTO.response = faqs;
      Logger().d("통신 =========", responseDTO.response.toString());
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "FAQ 목록 조회 에러");
    }
  }
}