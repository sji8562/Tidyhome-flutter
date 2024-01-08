import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/size.dart';

import '../../../../_core/constants/color.dart';


class JoinTextFormField extends ConsumerWidget {
  final String? strong;
  final bool? enabled;
  final String? initValue;
  final String? placeholderText;
  final bool obscureText;
  final FocusNode? focusNode;
  final funValidator;
  final changeFormData;
  final controller;
  final complete;

  const JoinTextFormField({
    Key? key,
    this.enabled,
    this.initValue,
    this.placeholderText,
    this.obscureText = false,
    required this.funValidator,
    this.focusNode,
    this.changeFormData,
    this.controller,
    this.strong,
    this.complete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: gap_xs),
        TextFormField(
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initValue,
          enabled: enabled,
          controller: controller,
          onChanged: changeFormData,
          validator: funValidator,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            hintText: "$placeholderText",
            hintStyle: TextStyle(
              color: formColor,
              fontSize: 14,
            ),
            border: InputBorder.none,
            errorBorder: UnderlineInputBorder(
              // 5. 에러발생시 TextFormField 디자인
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              // 5. 에러가 발생 후 손가락을 터치했을 때 TextFormField 디자인
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
