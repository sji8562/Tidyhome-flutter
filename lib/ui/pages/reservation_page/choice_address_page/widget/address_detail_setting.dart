import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:toyproject/_core/constants/size.dart';
import 'package:toyproject/data/dto/request_dto/address/address_request.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/widget/address_detail_text_form.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

import '../../../../../_core/constants/color.dart';
import '../../../../widget/button/color_button.dart';

class AddressDetailSetForm extends ConsumerStatefulWidget {

  final KopoModel? model;
  const AddressDetailSetForm({Key? key, required this.model}) : super(key: key);

  @override
  ConsumerState<AddressDetailSetForm> createState() => _AddressDetailSetFormState();
}

class _AddressDetailSetFormState extends ConsumerState<AddressDetailSetForm> {
  final addressDetailInput = TextEditingController();
  bool isDefaultAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: "상세 주소 입력",),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AddressDetailTextForm(
                        hintText: "상세주소를 입력하세요",
                        title: "${widget.model!.address}",
                        controller: addressDetailInput),
                  ),
                  SizedBox(height: 50),
                  Container(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CheckBoxRounded(
                                    onTap: (bool? value) {
                                      setState(() {
                                        isDefaultAddress = value ?? false;
                                      });
                                    },
                                    checkedColor: primaryColor,
                                    size: 24.0,
                                    uncheckedWidget: Icon(
                                      Icons.check,
                                      size: 20,
                                      color: basicColorB9,
                                    ),
                                  ),
                                  SizedBox(
                                    width: gap_xs,
                                  ),
                                  Text(
                                    "기본 배송지로 저장",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  ColorButton(
                    text: "저장",
                    funPageRoute: () {
                      AddressSaveReqDTO dto = AddressSaveReqDTO(
                          widget.model!.address!, addressDetailInput.text, isDefaultAddress, ref.read(sessionProvider).user!.id!);
                      ref.read(choiceAddressProvider.notifier).addAddress(dto);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
