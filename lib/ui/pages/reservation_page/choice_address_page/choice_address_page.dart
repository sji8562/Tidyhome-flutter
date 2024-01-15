import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/widget/choice_address_page_body.dart';
import '../../../widget/arrow_app_bar.dart';

class ChoiceAddressPage extends StatelessWidget {
  const ChoiceAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: "주소 관리"),
      body: ChoiceAddressPageBody(),
    );
  }
}
