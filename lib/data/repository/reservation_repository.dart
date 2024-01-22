import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/http.dart';
import 'package:toyproject/data/dto/request_dto/reservation/reservation_request.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/reservation.dart';
import 'package:toyproject/data/model/reservationDetail.dart';

class ReservationRepository {
  // 예약 내역 조회
  Future<ResponseDTO> fetchReservation(int id, String jwt) async {
    Logger().d("fetchReservation 진입");
    try {
      Response<dynamic> response =
      await dio.get("/reservation/list/all/$id", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }));
      Logger().d("예약내역 리스트 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("예약내역 리스트 요청 통신 진입1111111111111111");
      List<dynamic> mapList = responseDTO.response;
      Logger().d("예약내역 리스트 요청 통신 진입 2222222222222222");
      List<Reservation> reservations = mapList.map((e) =>
          Reservation.fromJson(e)).toList();
      responseDTO.response = reservations;
      Logger().d("통신 =========", responseDTO.response.toString());
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(
          success: false, response: null, error: "예약내역 목록 조회 에러");
    }
  }

  // 완료된 서비스 내역 조회
  Future<ResponseDTO> fetchCompletedReservation(int id, String jwt) async {
    Logger().d("fetchCompletedReservation 진입");
    try {
      Response<dynamic> response =
      await dio.get("/reservation/list/completed/$id", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }));
      Logger().d("완료된 서비스 리스트 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response;
      List<Reservation> reservations = mapList.map((e) =>
          Reservation.fromJson(e)).toList();
      responseDTO.response = reservations;
      Logger().d("통신 =========", responseDTO.response.toString());
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(
          success: false, response: null, error: "완료된 서비스 목록 조회 에러");
    }
  }

  // 예약 내역 상세
  Future<ResponseDTO> fetchReservationDetail(int id, String jwt) async {
    Logger().d("fetchReservationDetail 진입");
    try {
      Response<dynamic> response = await dio.get("/reservation/list/$id", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }));
      Logger().d("fetchReservationDetail 진입 111111111111");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("fetchReservationDetail 진입 222222222222");
      Logger().d(responseDTO.response);
      responseDTO.response = ReservationDetail.fromJson(responseDTO.response);
      ReservationDetail reservationDetail = responseDTO.response;
      Logger().d(reservationDetail.toString());
      Logger().d("fetchReservationDetail 진입 333333333333");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(
          success: false, response: null, error: "예약 내역 상세 조회 에러");
    }
  }

  // Future<ResponseDTO> fetchReservationSave() async {
  //   try {
  //     Response<dynamic> response = await dio.get("/reservation");
  //     Logger().d("fetchReservationSave진입 111111111111");
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     Logger().d("fetchReservationSave진입 222222222222");
  //     Logger().d(responseDTO.response.toString());
  //     responseDTO.response = ReservationDetail.fromJson(responseDTO.response);
  //     Logger().d("fetchReservationSave진입 333333333333");
  //     return responseDTO;
  //   } catch (e) {
  //     return ResponseDTO(
  //         success: false, response: null, error: "예약 내역 상세 조회 에러");
  //   }
  // }

  Future<ResponseDTO> fetchReservationUpdate(
      ReservationUpdateDTO request, String jwt) async {
    try {
      Response<dynamic> response = await dio.post(
          "/reservation/list/${request.id}/update", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }), data: request.toJson());
      Logger().d("fetchReservationUpdate진입 111111111111");
      Logger().d(request.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("fetchReservationUpdate진입 222222222222");
      Logger().d(responseDTO.response.toString());
      Logger().d("fetchReservationSave진입 333333333333");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(
          success: false, response: null, error: "예약 내역 상세 조회 에러");
    }
  }

  Future<ResponseDTO> fetchReservationCancel(int id, String jwt) async {
    try {
      final response = await dio.post(
          "/reservation/cancel/$id", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }));
      Logger().d("fetchReservationCancel진입 111111111111");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("fetchReservationCancel진입 222222222222");
      Logger().d(responseDTO.response.toString());
      Logger().d("fetchReservationCancel진입 333333333333");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(
          success: false, response: null, error: "예약 내역 상세 조회 에러");
    }
  }

    Future<ResponseDTO> deleteEnterAccessMethods(int reservationId, String jwt) async {
      try {
        Logger().d("출입 방법 삭제 호출");
        Response<dynamic> response = await dio.post(
            "/reservation/list/$reservationId/enter/delete", options: Options(headers: {
          "Authorization": "Bearer $jwt",
          // 다른 필요한 헤더도 추가할 수 있습니다.
        }));
        Logger().d("결과 ================ 1111111");
        Logger().d(response);
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        Logger().d("결과 ================ 22222222222");
        return responseDTO;
      } catch (e) {
        return ResponseDTO(
            success: false, response: null, error: "출입 방법 삭제 에러");
      }
    }

  Future<ResponseDTO> fetchEnterAccessMethodsSave(EnterAccessUpdateDTO request, String jwt) async {
    try {
      Logger().d("출입 방법 업데이트 호출");
      Response<dynamic> response = await dio.post(
          "/reservation/list/${request.reservationId}/enter", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }), data: request.toJson());
      Logger().d("출입 방법 업데이트 1111111");
      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("출입 방법 업데이트 22222222222");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(
          success: false, response: null, error: "출입 방법 업데이트 에러");
    }
  }

  Future<ResponseDTO> deleteOtherRequestMethods(reservationId, String jwt) async {
    try {
      Logger().d("기타 요청사항 삭제 호출");
      Response<dynamic> response = await dio.post(
          "/reservation/list/$reservationId/request/delete", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }));
      Logger().d("결과 ================ 1111111");
      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("결과 ================ 22222222222");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(
          success: false, response: null, error: "기타 요청사항 삭제 에러");
    }
  }

  Future<ResponseDTO> fetchUpdateOtherRequestMethods(OtherRequestUpdateDTO request, String jwt) async {
    try {
      Logger().d("기타 요청사항 업데이트 호출");
      Response<dynamic> response = await dio.post(
          "/reservation/list/${request.reservationId}/request", options: Options(headers: {
        "Authorization": "Bearer $jwt",
        // 다른 필요한 헤더도 추가할 수 있습니다.
      }), data: request.toJson());
      Logger().d("기타 요청사항 업데이트 호출 1111111");
      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("기타 요청사항 업데이트 호출 22222222222");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(
          success: false, response: null, error: "기타 요청사항 업데이트 에러");
    }
  }

  }
