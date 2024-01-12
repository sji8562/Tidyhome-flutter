import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/company_update_info_page/widget/company_update_info_last_page_body.dart';

import '../../../_core/constants/Define.dart';
import '../../../_core/constants/color.dart';
import '../../../_core/constants/move.dart';
import '../../widget/button/color_button.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CompanyUpdateInfoLastPage extends ConsumerStatefulWidget {
  const CompanyUpdateInfoLastPage({super.key});

  @override
  ConsumerState<CompanyUpdateInfoLastPage> createState() => _CompanyUpdateInfoLastPageState();
}

class _CompanyUpdateInfoLastPageState extends ConsumerState<CompanyUpdateInfoLastPage> {
  final picker = ImagePicker();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
  List<XFile?> multiImage = []; // 갤러리에서 여러 장의 사진을 선택해서 저장할 변수
  List<XFile?> images = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompanyUpdateInfoLastPageBody());
  }
}

