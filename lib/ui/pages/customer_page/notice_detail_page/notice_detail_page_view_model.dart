import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/notice.dart';
import 'package:toyproject/data/repository/notice_repository.dart';
import 'package:toyproject/data/store/session_store.dart';
//창고 데이터
class NoticeDetailPageModel {
  Notice? notice;

  NoticeDetailPageModel(this.notice);
}

//창고
class NoticeDetailPageViewModel extends StateNotifier<NoticeDetailPageModel?>{
  Ref ref;
  NoticeDetailPageViewModel(super._state, this.ref);

  Future<void> fetchNoticeDetail(id) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await NoticeRepository().fetchNoticeDetail(id, ref.read(sessionProvider).jwt!);
    state = NoticeDetailPageModel(responseDTO.response);

  }

}
//창고관리자
final noticeDetailProvider =
StateNotifierProvider.family.autoDispose<NoticeDetailPageViewModel, NoticeDetailPageModel?, int>((ref, id) {
  return NoticeDetailPageViewModel(NoticeDetailPageModel(null), ref)..fetchNoticeDetail(id);
});