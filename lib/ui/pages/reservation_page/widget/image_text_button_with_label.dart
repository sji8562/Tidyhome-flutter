import 'package:flutter/material.dart';
import 'package:toyproject/_core/constants/Define.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/style.dart';

class ImageAndTextAndButtonWithLabel extends StatelessWidget {
  final String icon_name;
  final String title;
  final String? button_text;
  final bool is_active;
  final acting;

  const ImageAndTextAndButtonWithLabel({super.key, required this.icon_name, required this.title, this.button_text, this.is_active = false, this.acting});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset('${Define.icons + icon_name}'),
              SizedBox(width: 10.0,),
              textBody6(title),
            ],
          ),
          InkWell(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  button_text ?? '없음', style: TextStyle(color: !is_active ? disableColor : primaryColor),
                ),
              ),
              color: bgAndLineColor,
            ),
            onTap: acting != null ? acting : () {},
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
