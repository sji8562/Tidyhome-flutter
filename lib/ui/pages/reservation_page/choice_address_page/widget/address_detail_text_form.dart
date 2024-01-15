import 'package:flutter/material.dart';

class AddressDetailTextForm extends StatelessWidget {
  AddressDetailTextForm(
      {required this.title, required this.hintText, required this.controller});
  String title;
  String hintText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          child: Text(
            "${title}",
            style: TextStyle(fontSize: 17),
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "${hintText}",
            contentPadding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
          ),
        )
      ],
    );
  }
}
