// 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/reservation_repository.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page/reservation_page.dart';

import '../../../../data/model/reservation.dart';

class CompletedReservationPageModel {
  List<Reservation> reservationList;

  CompletedReservationPageModel(this.reservationList);
}

// 창고
class CompletedReservationPageViewModel extends StateNotifier<CompletedReservationPageModel?> {
  CompletedReservationPageViewModel(super._state);

  Future<void> fetchCompletedReservation() async {
    Logger().d("fetchCompletedReservation 뷰모델 메서드 진입");
    // 1. 통신 코드
    ResponseDTO responseDTO = await ReservationRepository().fetchCompletedReservation();
    state = CompletedReservationPageModel(responseDTO.response);
  }
}

// 창고관리자
final completedReservationProvider =
StateNotifierProvider<CompletedReservationPageViewModel, CompletedReservationPageModel?>((ref) {
  return CompletedReservationPageViewModel(CompletedReservationPageModel([]))..fetchCompletedReservation();
});