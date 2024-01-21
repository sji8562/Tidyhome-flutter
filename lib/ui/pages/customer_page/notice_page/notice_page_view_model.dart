import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/notice.dart';
import 'package:toyproject/data/repository/notice_repository.dart';
import 'package:toyproject/data/store/session_store.dart';
//창고 데이터
class NoticePageModel {
  List<Notice> noticeList;

  NoticePageModel(this.noticeList);
}

//창고
class NoticePageViewModel extends StateNotifier<NoticePageModel?>{
  Ref ref;
  NoticePageViewModel(super._state, this.ref);

  Future<void> fetchNotice() async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await NoticeRepository().fetchNotice(ref.read(sessionProvider).jwt!);
    state = NoticePageModel(responseDTO.response);

  }

}
//창고관리자
final noticeProvider =
StateNotifierProvider<NoticePageViewModel, NoticePageModel?>((ref) {
  return NoticePageViewModel(NoticePageModel([]), ref)..fetchNotice();
});