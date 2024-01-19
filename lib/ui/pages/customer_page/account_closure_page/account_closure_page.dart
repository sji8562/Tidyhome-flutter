import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/customer_page/account_closure_page/widget/account_closure_page_body.dart';


class AccountClosurePage extends ConsumerWidget {
  const AccountClosurePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AccountClosurePageBody();
  }
}
