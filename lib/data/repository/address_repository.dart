import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';

import '../../_core/constants/http.dart';
import '../dto/request_dto/address/address_request.dart';
import '../model/Address.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class AddressRepository {
  Future<ResponseDTO> fetchAddressList(int id, String jwt) async {
    try {
      // 1. 통신
      final response = await dio.get("/api/address/list/$id",options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }),);
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

  Future<ResponseDTO> savePost(AddressSaveReqDTO dto, String jwt) async {
    Logger().d("-----jwt-------확인중");
    Logger().d(jwt);
    Logger().d(dto.userId);
    Logger().d(dto.addressDetail);
    Logger().d(dto.address);
    Logger().d("savePost 호출");

    // 통신은 무조건 try-catch
    try {
      // 1. 통신
      final response = await dio.post("/api/address/add", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }), data: dto.toJson());

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

  Future<ResponseDTO> setFirstAddress(SetFirstAddressDTO dto, String jwt) async {
    try {
      // 1. 통신
      final response = await dio.post("/api/address/add/first-address", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }), data: dto.toJson());
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "대표 주소 설정 실패");
    }
  }

}
