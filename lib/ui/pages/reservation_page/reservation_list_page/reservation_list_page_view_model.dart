// 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/reservation_repository.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page/reservation_page.dart';

import '../../../../data/model/reservation.dart';

class ReservationPageModel {
  List<Reservation> reservationList;

  ReservationPageModel(this.reservationList);
}

// 창고
class ReservationPageViewModel extends StateNotifier<ReservationPageModel?> {
  Ref ref;
  ReservationPageViewModel(super._state, this.ref);

  Future<void> fetchReservation() async {
    Logger().d("fetch reservation 뷰모델 메서드 진입");
    // 1. 통신 코드
    ResponseDTO responseDTO = await ReservationRepository().fetchReservation(ref.read(sessionProvider).user!.id!, ref.read(sessionProvider).jwt!);
    state = ReservationPageModel(responseDTO.response);
  }


}

// 창고관리자
final reservationProvider =
    StateNotifierProvider.autoDispose<ReservationPageViewModel, ReservationPageModel?>((ref) {
      return ReservationPageViewModel(ReservationPageModel([]), ref)..fetchReservation();
    });