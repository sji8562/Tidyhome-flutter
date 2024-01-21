import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../data/dto/request_dto/address/address_request.dart';
import '../../../../data/dto/response_dto/response_dto.dart';
import '../../../../data/model/Address.dart';
import '../../../../data/repository/address_repository.dart';
import '../../../../data/store/session_store.dart';
import '../../../../main.dart';


class ChoiceAddressPageModel {
  List<Address>? addressList;

  ChoiceAddressPageModel(this.addressList);
}


class ChoiceAddressPageViewModel extends StateNotifier<ChoiceAddressPageModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ChoiceAddressPageViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    SessionStore sessionStore = ref.read(sessionProvider);
    print("Address notifyInit 실행");
    // 1. 통신 코드
    ResponseDTO responseDTO = await AddressRepository().fetchAddressList(
        sessionStore.user!.id!, sessionStore.jwt!);
    print("AddressViewModel 통신코드실행 responseDTO : ${responseDTO.response}");
    List<Address> addresses = responseDTO.response;
    print("Address 파싱 responseDTO : ${addresses}");
    // 2. 비지니스 로직
    state = ChoiceAddressPageModel(addresses);
  }

  //choice true로 변경하기
  void updateIsCheckedAtIndex(int index) {
    if (index >= 0 && index < state!.addressList!.length) {
      // map을 사용하여 새로운 리스트를 생성하고 isChecked를 업데이트
      List<Address> addresses = state!.addressList!.map((address) {
        if (address == state!.addressList![index]) {
          return address.copyWith(choice: true);
        } else {
          return address.copyWith(
              choice: false); // 다른 요소들의 isChecked를 false로 설정
        }
      }).toList();

      state = ChoiceAddressPageModel(addresses);
    }
  }

  int findCheckedAddress(int index) {
    Address address = state!.addressList!.where((e) => e.choice == true).first;
    return address.id!;
  }

  Future<void> setFirstAddress(int index) async {
    SetFirstAddressDTO dto = SetFirstAddressDTO(ref
        .read(sessionProvider)
        .user!
        .id!, findCheckedAddress(index));
    ResponseDTO responseDTO = await AddressRepository().setFirstAddress(dto, ref.read(sessionProvider)!.jwt!);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("대표 주소 설정 완료"!),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }

  Future<void> addAddress(AddressSaveReqDTO dto) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await AddressRepository().savePost(dto, sessionStore.jwt!);

    if (responseDTO.success == true) {
      Logger().d("responseDTO.success 성공 : ${responseDTO.success}");
      // responseDTO는 dynamic타입, 실제로는 data가 Address타입 (묵시적 다운캐스팅이 가능)
      // as Address; 뒤에 붙여두면 명시적 다운캐스팅도 가능
      // 묵시적이라도 캐스팅 해야하므로 newAddress에 대입하는 코드가 반드시 분리되어야함
      Address newAddress = responseDTO.response;
      List<Address> addresses = state!.addressList!;
      List<Address> newAddresses = [];
      if (newAddress.choice == true) {
        List<Address> modifiedAddresses = addresses.map((e) =>
            e.copyWith(choice: false)).toList();
        newAddresses = [newAddress, ...modifiedAddresses];
      } else {
        newAddresses = [newAddress, ...addresses];
      }
      state = ChoiceAddressPageModel(newAddresses);
      // 이 부분에서 뷰모델 데이터 갱신이 완료 << watch 구독자가 rebuild됨
      Navigator.pop(mContext!);
    } else {
      Logger().d("responseDTO.success 실패 : ${responseDTO.success}");
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("주소 등록 실패 : ${responseDTO.error}"),
        ),
      );
    }
  }


  Address? findFirstAddress() {
    List<Address> addresses = state!.addressList!;
    if (addresses != null) {
      return addresses
          .where((address) => address.choice == true)
          .firstOrNull;
    }
    return null;
  }

}

final choiceAddressProvider = StateNotifierProvider.autoDispose<ChoiceAddressPageViewModel, ChoiceAddressPageModel?>((ref) {
return ChoiceAddressPageViewModel(ChoiceAddressPageModel([]), ref)..notifyInit();
});


