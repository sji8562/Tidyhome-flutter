import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:toyproject/data/model/Address.dart';
import 'package:toyproject/data/store/session_store.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/choice_address_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page/widget/address_detail_setting.dart';
import 'package:toyproject/ui/pages/reservation_page/widget/choice_address_tab.dart';
import 'package:toyproject/ui/widget/button/soft_color_button.dart';
import 'package:toyproject/ui/widget/loading.dart';

class ChoiceAddressPageBody extends ConsumerWidget {
  /// Controller
  // _postcodeController 지번을 받음
  final TextEditingController _postcodeController = TextEditingController();
  // _postcodeController 주소를 받음
  final TextEditingController _addressController = TextEditingController();
  // _addressDetailController 상세 주소를 받음
  final TextEditingController _addressDetailController = TextEditingController();

  ChoiceAddressPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, String> formData = {};
    ref.read(sessionProvider).setUser();
    ChoiceAddressPageModel? choiceAddressPageModel = ref.watch(choiceAddressProvider);
    if (choiceAddressPageModel?.addressList == null) {
      return const Loading();
    }
    List<Address> addresses = choiceAddressPageModel!.addressList!;
    return Stack(
      children: [
        ListView.builder(
          itemCount: addresses.length, // length
          itemBuilder: (context, index) {
            return Column(
              children: [
                ChoiceAddressTab(text: addresses[index].address + "  "+ addresses[index].addressDetail, index: index),
              ],
            );
          },
        ),
        Positioned(
          bottom: 10,
          child: SoftColorButton(text: '새 주소 등록', funPageRoute: () async {
            KopoModel? model = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RemediKopo(),
              ),
            );
            if (model != null) {
              final postcode = model.zonecode ?? '';
              _postcodeController.value = TextEditingValue(
                text: postcode,
              );
              formData['postcode'] = postcode;

              final address = model.address ?? '';
              _addressController.value = TextEditingValue(
                text: address,
              );
              formData['address'] = address;

              final buildingName = model.buildingName ?? '';
              _addressDetailController.value = TextEditingValue(
                text: buildingName,
              );
              formData['address_detail'] = buildingName;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddressDetailSetForm(model: model,)
                ),
              );
            }
          }),
        )
      ],

    );
  }
}
