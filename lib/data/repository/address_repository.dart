import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';

import '../../_core/constants/http.dart';
import '../dto/request_dto/address/address_request.dart';
import '../model/Address.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class AddressRepository {
  Future<ResponseDTO> fetchAddressList(id) async {
    try {
      // 1. 통신
      final response = await dio.get("/api/address/list/$id");
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response;
      List<Address> addresses = mapList.map((e) => Address.fromJson(e)).toList();
      responseDTO.response = addresses;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "주소목록 불러오기실패");
    }
  }

  Future<ResponseDTO> savePost(AddressSaveReqDTO dto) async {
    Logger().d("savePost 호출");
    // 통신은 무조건 try-catch
    try {
      // 1. 통신
      final response = await dio.post("/api/address/add", data: dto.toJson());

      Logger().d("save 통신코드 toJson : ${dto.toJson()}");
      Logger().d("save 통신코드 response : ${response}");

      // 2. 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("save 통신코드 ResponseDTO.fromJson : ${responseDTO}");
      responseDTO.response = Address.fromJson(responseDTO.response);
      return responseDTO;
    }
    // 200이 아니면 catch로 감
    catch (e) {
      return ResponseDTO(success: false, response: "주소 등록 실패.", error: null);
    }
  }

  Future<ResponseDTO> setFirstAddress(SetFirstAddressDTO dto) async {
    try {
      // 1. 통신
      final response = await dio.post("/api/address/add/first-address", data: dto.toJson());
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "대표 주소 설정 실패");
    }
  }

}
