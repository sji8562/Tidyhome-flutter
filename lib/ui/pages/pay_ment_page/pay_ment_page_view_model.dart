
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/dto/request_dto/payment/payment_request.dart';
import 'package:toyproject/data/dto/response_dto/reservation_result/reservation_result.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/payment_repository.dart';
import 'package:toyproject/main.dart';

class PaymentPageModel {
 ReservationResult? reservationResult;

 PaymentPageModel(this.reservationResult);
}

class PaymentPageViewModel extends StateNotifier<PaymentPageModel?>{
  final mContext = navigatorKey.currentContext;
  PaymentPageViewModel(super._state);

  Future<void> fetchPayment(PaymentRequestDTO dto) async {
    ResponseDTO responseDTO = await PaymentRepository().fetchPayment(dto);
    Logger().d("이거 나오나요");
    Logger().d(responseDTO.success);
    state = PaymentPageModel(responseDTO.response);

    if(responseDTO.success == true){
      Navigator.pushNamed(mContext!, Move.ReservationConfirmPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("결제에 실패하였습니다."),
        ),
      );
    }
  }



}


final paymentProvider =
StateNotifierProvider<PaymentPageViewModel, PaymentPageModel?>((ref) {
  return PaymentPageViewModel(PaymentPageModel(null));
});
