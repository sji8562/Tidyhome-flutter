import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/pay_ment_page/widget/pay_ment_page_body.dart';

class PayMentPage extends StatelessWidget {
  int price;
  String serviceName;
  String optionName;
  PayMentPage(this.price, this.serviceName, this.optionName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PayMentPageBody(price: price, serviceName: serviceName, optionName: optionName),
    );
  }
}
