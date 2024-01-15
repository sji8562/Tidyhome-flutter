import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/pay_ment_page/widget/pay_ment_page_body.dart';

class PayMentPage extends StatelessWidget {
  const PayMentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PayMentPageBody(hour: 2,price: 1000),
    );
  }
}
