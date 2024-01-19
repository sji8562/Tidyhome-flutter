
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../widget/arrow_app_bar.dart';

import 'account_closure_page_body_item.dart';

class AccountClosurePageBody extends ConsumerWidget {
  const AccountClosurePageBody({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: ''),
        body: SingleChildScrollView(
          child:
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AccountColumn()
          ),
        ));
  }
}

