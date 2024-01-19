import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/http.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/option_price.dart';

class OptionRepository{
  // 공지사항 조회
  Future<ResponseDTO> fetchOptionList(int id) async {
    Logger().d("fetchNotice 진입");
    try {
      Response<dynamic> response =
      await dio.get("/api/option/detail?secondCategoryId=$id");
      Logger().d("옵션 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response["optionPrices"];
      List<OptionPrice> options = mapList.map((e) => OptionPrice.fromJson(e)).toList();
      responseDTO.response = options;
      Logger().d("통신 =========", responseDTO.response.toString());
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "옵션 리스트 받기 에러");
    }
  }
}