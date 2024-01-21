
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/dto/request_dto/payment/payment_request.dart';
import 'package:toyproject/data/dto/response_dto/reservation_result/reservation_result.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/payment_repository.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/main.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/home_work_apply_page/home_work_apply_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/moving_cleaning_apply_page/moving_cleaning_apply_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/office_cleaning_apply_page/office_cleaning_apply_page_view_model.dart';

class PaymentPageModel {
 ReservationResult? reservationResult;

 PaymentPageModel(this.reservationResult);
}

class PaymentPageViewModel extends StateNotifier<PaymentPageModel?>{
  final mContext = navigatorKey.currentContext;
  Ref ref;
  PaymentPageViewModel(super._state, this.ref);

  Future<void> fetchPayment(PaymentRequestDTO dto) async {
    ResponseDTO responseDTO = await PaymentRepository().fetchPayment(dto, ref.read(sessionProvider).jwt!);
    Logger().d("이거 나오나요");
    Logger().d(responseDTO.success);
    state = PaymentPageModel(responseDTO.response);

    if(responseDTO.success == true){
      ref.read(homeWorkApplyProvider.notifier).addServiceTime();
      ref.read(movingCleaningApplyProvider.notifier).addServiceTime();
      ref.read(officeCleaningApplyProvider.notifier).addServiceTime();
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
  return PaymentPageViewModel(PaymentPageModel(null), ref);
});
