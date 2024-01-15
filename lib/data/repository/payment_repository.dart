import 'package:dio/dio.dart';

import 'package:logger/logger.dart';

import '../../_core/constants/http.dart';
import '../dto/request_dto/payment/payment_request.dart';
import '../dto/response_dto/response_dto.dart';

class paymentRepository {
  Future<ResponseDTO> fetchPayment(PaymentRequestDTO dto) async {
    try {
      Logger().d("들어오니?");
      Response response = await dio.post(
        "/payment/result",
        data: dto.toJson(),
      );
      Logger().d("와주라 제발");
      // options: Options(headers: {"Authorization": "${jwt}"}));

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      Logger().d("통신된거자나");
      return responseDTO;
    } catch (e) {
      Logger().d("dio 통신 되? ${e.toString()}");
      return new ResponseDTO(success: false, response: null, error: "통신실패");
    }
  }
}