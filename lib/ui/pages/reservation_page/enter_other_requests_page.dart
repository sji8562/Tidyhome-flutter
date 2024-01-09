import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

// TODO 기타 요청사항 페이지
class EnterOtherRequestsPage extends ConsumerWidget {
  const EnterOtherRequestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '기타 요청사항'),
    );
  }

}