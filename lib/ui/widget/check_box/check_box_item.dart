import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/size.dart';

import '../../../_core/constants/color.dart';

class CheckBoxItem extends ConsumerWidget {
  static const double defaultSize = 24.0;
  String text;
  TextStyle? textStyle;
  double? iconSize;
  CheckBoxItem({
    required this.text,
    this.textStyle,
    this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        CheckBoxRounded(
          isChecked: true,
          onTap: (bool? value) {},
          checkedColor: primaryColor02,
          size: iconSize ?? defaultSize,
          uncheckedWidget: Icon(
            Icons.check,
            size: 20 ?? defaultSize,
            color: basicColorB9,
          ),
        ),
        SizedBox(
          width: gap_xs,
        ),
        Text(
          "$text",
          style: textStyle,
        ),
      ],
    );
  }
}
