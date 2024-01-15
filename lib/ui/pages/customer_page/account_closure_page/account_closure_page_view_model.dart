
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/data/dto/response_dto/response_dto.dart';
import 'package:toyproject/data/repository/user_repository.dart';
import 'package:toyproject/main.dart';

class accountClosureViewModel {
  final mContext = navigatorKey.currentContext;

  Future<void> accountClose() async {
    Logger().d("======= 탈퇴하기 =======");
    ResponseDTO responseDTO = await UserRepository().fetchCloseAccount();

    if(responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("회원 탈퇴 성공"),
        ),
      );
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
    Provider<accountClosureViewModel>((ref) {
      return accountClosureViewModel();
    });