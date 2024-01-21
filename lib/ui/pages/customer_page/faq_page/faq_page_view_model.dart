import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/model/Faq.dart';
import 'package:toyproject/data/repository/faq_repository.dart';
import 'package:toyproject/data/store/session_store.dart';

class FaqPageModel {
  List<Faq> faqList;

  FaqPageModel(this.faqList);
}

class FaqPageViewModel extends StateNotifier<FaqPageModel?> {
  Ref ref;
  FaqPageViewModel(super._state, this.ref);

  Future<void> fetchFaq(partId) async {
    ResponseDTO responseDTO = await FaqRepository().fetchFaq(partId, ref.read(sessionProvider).jwt!);
    state = FaqPageModel(responseDTO.response);
  }
}

final faqProvider =
    StateNotifierProvider<FaqPageViewModel, FaqPageModel?>((ref) {
      return FaqPageViewModel(FaqPageModel([]), ref)..fetchFaq(3);
    });