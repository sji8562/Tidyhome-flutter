class PaymentRequestDTO {
  int userId;
  String productName;

  PaymentRequestDTO(this.userId, this.productName);

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "productName": productName,
  };
}