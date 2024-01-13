import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page_view_model.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/define.dart';
import '../../../../data/model/Address.dart';

class ChoiceAddressTab extends ConsumerWidget {
  int? index;
  String text;

  ChoiceAddressTab({required this.text, this.index, super.key}); // const ReservationTap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChoiceAddressPageModel? choiceAddressPageModel = ref.watch(choiceAddressProvider);
    List<Address> myList = choiceAddressPageModel!.addressList!;
    return Container(
      child:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                ref.read(choiceAddressProvider.notifier).updateIsCheckedAtIndex(index ?? 1);
                ref.read(choiceAddressProvider.notifier).setFirstAddress(index ?? 1);
              }, // 선택 시 isChecked 변경
              child: Row(
                children: [
                  Text(text, style: TextStyle(color: myList[index!].choice == true ? basicColorB1 : disableColor,
                                              fontWeight: myList[index!].choice == true? FontWeight.bold : FontWeight.normal)),
                  Icon(Icons.check, color: myList[index!].choice == true ? primaryColor : disableColor, size: 15.0,),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: disableColor,
            ),
          )
        ],

      ),
    );
  }
}
