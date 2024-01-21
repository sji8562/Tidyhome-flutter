
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/user_repository.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/main.dart';
import 'package:toyproject/ui/pages/join_page/join_page_view_model.dart';

class AccountClosureViewModel {
  Ref ref;
  final mContext = navigatorKey.currentContext;
  AccountClosureViewModel(this.ref);

  Future<void> accountClose() async {
    Logger().d("======= 탈퇴하기 =======");
    ResponseDTO responseDTO = await UserRepository().fetchCloseAccount(ref.read(sessionProvider).user!.id!, ref.read(sessionProvider).jwt!);

    if(responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("회원 탈퇴 성공"),
        ),
      );
      ref.read(sessionProvider).delUser();
      ref.read(joinChatProvider.notifier).addUserGubun();
      Navigator.pushNamed(mContext!, Move.StartPage);

    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }
}

final accountClosureProvider =
    Provider<AccountClosureViewModel>((ref) {
      return AccountClosureViewModel(ref);
    });