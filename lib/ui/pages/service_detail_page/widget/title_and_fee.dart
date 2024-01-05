import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';

class TitleAndFee extends StatelessWidget {
  final String title;
  final String imgUrl;

  const TitleAndFee({required this.title, required this.imgUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text('${title}서비스 요금',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ))),
        ),
        Image(image: AssetImage(Define.images + imgUrl)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                '*요금은 주소에 따라 변동될 수 있습니다',
                style: TextStyle(color: disableColor),
              )),
        )
      ],
    );
  }
}
