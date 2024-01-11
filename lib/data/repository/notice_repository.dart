import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/http.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';

import '../model/notice.dart';

class NoticeRepository {
  // 공지사항 조회
  Future<ResponseDTO> fetchNotice() async {
    Logger().d("fetchNotice 진입");
    try {
      Response<dynamic> response =
      await dio.get("/api/notice");
      Logger().d("공지사항 리스트 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response;
      List<Notice> notices = mapList.map((e) => Notice.fromJson(e)).toList();
      responseDTO.response = notices;
      Logger().d("통신 =========", responseDTO.response.toString());
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "공지사항 조회 에러");
    }
  }
}