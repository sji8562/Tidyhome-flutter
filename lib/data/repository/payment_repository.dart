import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/reservation_result/reservation_result.dart';
import 'package:toyproject/data/model/reservationDetail.dart';

import '../../_core/constants/http.dart';
import '../dto/request_dto/payment/payment_request.dart';
import '../dto/response_dto/response_dto.dart';

class PaymentRepository {
  Future<ResponseDTO> fetchPayment(PaymentRequestDTO dto) async {
    try {
      Logger().d("들어오니?");
      final response = await dio.post(
        "/reservation/save",
        data: dto.toJson(),
      );
      Logger().d("와주라 제발");

      // options: Options(headers: {"Authorization": "${jwt}"}));
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ReservationResult.fromJson(responseDTO.response);

      Logger().d("통신된거자나");
      return responseDTO;
    } catch (e) {
      Logger().d("dio 통신 되? ${e.toString()}");
      return new ResponseDTO(success: false, response: null, error: "통신실패");
    }
  }
}