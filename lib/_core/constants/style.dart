import 'package:flutter/material.dart';

Text textTitle0(String text) {
  return Text(
    "$text",
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

Text textTitle1(String text) {
  return Text(
    "$text",
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text textTitle2(String text) {
  return Text(
    "$text", maxLines: 1, // 텍스트의 최대 줄 수
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text textBody1(String text) {
  return Text(
    "$text",
    style: TextStyle(color: Colors.black, fontSize: 13),
  );
}
Text textBody5(String text) {
  return Text(
    "$text",
    style: TextStyle( fontSize: 15),
  );
}

Text textBody3(String text) {
  return Text("$text", style: TextStyle(color: Colors.black, fontSize: 11));
}

Text textBody2(String text, {int maxLine = 2}) {
  return Text(
    "$text",
    style: TextStyle(color: Colors.black, fontSize: 10),
    maxLines: maxLine,
  );
}

Text textBody4(String text) {
  return Text(
    "$text",
    style: TextStyle(color: Colors.grey, fontSize: 13),
  );
}
Text orderText(String text) => Text("$text ",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),);
// Text orderText(String text){
//   return Text orderText() => Text("",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),);
// }