class AddressSaveReqDTO {
  String address;
  String addressDetail;
  bool choice;
  int userId;


  AddressSaveReqDTO(
      this.address, this.addressDetail, this.choice, this.userId);

  Map<String, dynamic> toJson() => {
        "address": address,
        "addressDetail": addressDetail,
        "choice": choice,
        "userId": userId
      };
}

class SetFirstAddressDTO {
  final int userId;
  final int addressInfoId;

  SetFirstAddressDTO(this.userId, this.addressInfoId);

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "addressInfoId": addressInfoId
  };
}
