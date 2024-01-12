import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/utils/validator_util.dart';
import 'package:toyproject/data/dto/request_dto/user/user_request.dart';
import 'package:toyproject/data/model/JoinField.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/join_page/join_page_view_model.dart';
import 'package:toyproject/ui/pages/join_page/widget/join_page_body.dart';
import 'package:toyproject/ui/widget/text_form_field/common_text_form_field.dart';
import 'package:toyproject/ui/widget/text_form_field/custom_text_form_field.dart';

import 'widget/join_text_form_field.dart';

class JoinPage extends StatelessWidget {

  const JoinPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: formColor,
      body: JoinPageBody(),
    );
  }
}
