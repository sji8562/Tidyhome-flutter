// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/request_dto/reservation/reservation_request.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/reservation_repository.dart';
import 'package:toyproject/main.dart';

class EnterAccessMethodsPageModel {

}

// 창고
class EnterAccessMethodsPageViewModel extends StateNotifier<EnterAccessMethodsPageModel?> {
  final mContext = navigatorKey.currentContext;
  EnterAccessMethodsPageViewModel(super._state);

  Future<void> deleteEnterAccessMethods(reservationId) async {
    Logger().d("deleteEnterAccessMethods 진입");
    ResponseDTO responseDTO = await ReservationRepository().deleteEnterAccessMethods(reservationId);

    if(responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("출입 방법 삭제 성공"),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }
  Future<void> updateEnterAccessMethods(EnterAccessUpdateDTO request) async {
    Logger().d("뷰모델 updateEnterAccessMethods 진입");
    ResponseDTO responseDTO = await ReservationRepository().fetchEnterAccessMethodsSave(request);

    if(responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("출입방법 업데이트 성공"),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }

}

// 창고 관리자
final enterAccessMethodsProvider =
    StateNotifierProvider<EnterAccessMethodsPageViewModel, EnterAccessMethodsPageModel?>((ref) {
      return EnterAccessMethodsPageViewModel(EnterAccessMethodsPageModel());
    });