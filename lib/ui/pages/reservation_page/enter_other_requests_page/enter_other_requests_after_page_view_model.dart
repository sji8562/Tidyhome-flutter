// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/request_dto/reservation/reservation_request.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/reservation_repository.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/main.dart';

class EnterOtherRequestsAfterPageModel {

}

// 창고
class EnterOtherRequestsAfterPageViewModel extends StateNotifier<EnterOtherRequestsAfterPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;
  EnterOtherRequestsAfterPageViewModel(super._state, this.ref);

  Future<void> deleteEnterOtherRequestsMethods(reservationId) async {
    Logger().d("deleteEnterOtherRequestsMethods 진입");
    ResponseDTO responseDTO = await ReservationRepository().deleteOtherRequestMethods(reservationId, ref.read(sessionProvider).jwt!);

    if(responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("기타 요청사항 삭제 성공"),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("삭제 실패"),
        ),
      );
    }
  }
  Future<void> updateOtherRequestsMethods(OtherRequestUpdateDTO request) async {
    Logger().d("뷰모델 updateOtherRequestsMethods 진입");
    ResponseDTO responseDTO = await ReservationRepository().fetchUpdateOtherRequestMethods(request, ref.read(sessionProvider).jwt!);
    if(responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("기타요청사항 업데이트 성공"),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("업데이트 실패"),
        ),
      );
    }
  }

}

// 창고 관리자
final enterOtherRequestsProvider =
StateNotifierProvider<EnterOtherRequestsAfterPageViewModel, EnterOtherRequestsAfterPageModel?>((ref) {
  return EnterOtherRequestsAfterPageViewModel(EnterOtherRequestsAfterPageModel(), ref);
});