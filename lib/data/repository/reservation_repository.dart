import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/http.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/reservation.dart';
import 'package:toyproject/data/model/reservationDetail.dart';

class ReservationRepository {
  // 예약 내역 조회
  Future<ResponseDTO> fetchReservation() async {
    Logger().d("fetchReservation 진입");
    try {
      Response<dynamic> response =
      await dio.get("/reservation/list");
      Logger().d("예약내역 리스트 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("예약내역 리스트 요청 통신 진입1111111111111111");
      List<dynamic> mapList = responseDTO.response;
      Logger().d("예약내역 리스트 요청 통신 진입 2222222222222222");
      List<Reservation> reservations = mapList.map((e) => Reservation.fromJson(e)).toList();
      responseDTO.response = reservations;
      Logger().d("통신 =========", responseDTO.response.toString());
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "예약내역 목록 조회 에러");
    }
  }

  // 완료된 서비스 내역 조회
  Future<ResponseDTO> fetchCompletedReservation() async {
    Logger().d("fetchCompletedReservation 진입");
    try {
      Response<dynamic> response =
      await dio.get("/reservation/list/completed");
      Logger().d("완료된 서비스 리스트 요청 통신 진입");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response;
      List<Reservation> reservations = mapList.map((e) => Reservation.fromJson(e)).toList();
      responseDTO.response = reservations;
      Logger().d("통신 =========", responseDTO.response.toString());
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "완료된 서비스 목록 조회 에러");
    }
  }

  // 예약 내역 상세
  Future<ResponseDTO> fetchReservationDetail(id) async {
    Logger().d("fetchReservationDetail 진입");
      try {
        Response<dynamic> response = await dio.get("/reservation/list/$id");
        Logger().d("fetchReservationDetail 진입 111111111111");
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        Logger().d("fetchReservationDetail 진입 222222222222");
        Logger().d(responseDTO.response.toString());
        responseDTO.response = ReservationDetail.fromJson(responseDTO.response);
        Logger().d("fetchReservationDetail 진입 333333333333");
        return responseDTO;
      } catch (e) {
        return ResponseDTO(success: false, response: null, error: "예약 내역 상세 조회 에러");
    }
  }

  Future<ResponseDTO> fetchReservationSave() async {
    try {
      Response<dynamic> response = await dio.get("/reservation");
      Logger().d("fetchReservationSave진입 111111111111");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("fetchReservationSave진입 222222222222");
      Logger().d(responseDTO.response.toString());
      responseDTO.response = ReservationDetail.fromJson(responseDTO.response);
      Logger().d("fetchReservationSave진입 333333333333");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "예약 내역 상세 조회 에러");
    }

  }
}