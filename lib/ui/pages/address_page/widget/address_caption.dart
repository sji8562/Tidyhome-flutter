import 'package:flutter/material.dart';

class AddressCaption extends StatelessWidget {
  const AddressCaption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info_outline),
          SizedBox(width: 5),
          Text(
            "배송지에 따라 상품정보 및 배송 유형이 달라질수 있습니다.",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
