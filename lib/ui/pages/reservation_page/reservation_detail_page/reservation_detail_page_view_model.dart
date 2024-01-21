import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/model/reservation.dart';
import 'package:toyproject/data/repository/reservation_repository.dart';
import 'package:toyproject/data/store/session_store.dart';

import '../../../../data/dto/response_dto/response_dto.dart';
import '../../../../data/model/reservationDetail.dart';

class ReservationDetailPageModel {
  ReservationDetail? reservationDetail;

  ReservationDetailPageModel(this.reservationDetail);
}

class ReservationDetailPageViewModel extends StateNotifier<ReservationDetailPageModel?>{
  Ref ref;
  ReservationDetailPageViewModel(super._state, this.ref);

  Future<void> fetchReservationDetail(id) async {
    Logger().d("나 실행되고있니?");
    // 1. 통신 코드
    ResponseDTO responseDTO = await ReservationRepository().fetchReservationDetail(id, ref.read(sessionProvider).jwt!);
    state = ReservationDetailPageModel(responseDTO.response);
  }

}
//창고관리자
final reservationDetailProvider =
StateNotifierProvider.family.autoDispose<ReservationDetailPageViewModel, ReservationDetailPageModel?, int>((ref, id) {
  return ReservationDetailPageViewModel(ReservationDetailPageModel(null), ref)..fetchReservationDetail(id);
});