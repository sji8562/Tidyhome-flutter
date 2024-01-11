import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/notice.dart';
import 'package:toyproject/data/repository/notice_repository.dart';
//창고 데이터
class NoticePageModel {
  List<Notice> noticeList;

  NoticePageModel(this.noticeList);
}

//창고
class NoticePageViewModel extends StateNotifier<NoticePageModel?>{
  NoticePageViewModel(super._state);

  Future<void> fetchNotice() async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await NoticeRepository().fetchNotice();
    state = NoticePageModel(responseDTO.response);

  }

}
//창고관리자
final noticeProvider =
StateNotifierProvider<NoticePageViewModel, NoticePageModel?>((ref) {
  return NoticePageViewModel(NoticePageModel([]))..fetchNotice();
});