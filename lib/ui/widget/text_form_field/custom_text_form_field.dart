import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String placeholderText;
  final bool obscureText;
  final funValidator;
  final TextEditingController controller;
  final String? initValue;

  const CustomTextFormField({
    Key? key,
    required this.placeholderText,
    this.obscureText = false,
    required this.funValidator,
    required this.controller,
    this.initValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (initValue != null) {
      controller.text = initValue!;
    }
    return TextFormField(
      controller: controller,
      validator: funValidator,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        hintText: "$placeholderText",
        enabledBorder: OutlineInputBorder(
          // 3. 기본 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          // 4. 손가락 터치시 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          // 5. 에러발생시 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // 5. 에러가 발생 후 손가락을 터치했을 때 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
