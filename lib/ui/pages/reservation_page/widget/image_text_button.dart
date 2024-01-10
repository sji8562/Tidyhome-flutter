import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/style.dart';

class ImageAndTextAndButton extends StatelessWidget {
  final String icon_name;
  final String title;
  final acting;

  const ImageAndTextAndButton({super.key, required this.icon_name, required this.title, this.acting});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: InkWell(
        onTap: acting != null ? acting : () {},
        child: Row(
          children: [
            Image.asset('${Define.icons + icon_name}'),
            SizedBox(width: 10.0,),
            textBody6(title),
          ],
        ),
      ),
    );
  }
}
