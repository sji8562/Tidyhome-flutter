import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/style.dart';
import '../company_code_table/company_code_table.dart';
import '../company_update_info_pages_view_model.dart';

class CompanyUpdateInfoThirdPageBody extends ConsumerWidget {
  const CompanyUpdateInfoThirdPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = 0;
    CompanyUpdateInfoPagesModel? companyUpdateInfoPagesModel =
    ref.watch(companyUpdateInfoProvider);
    List<ServiceLocation> serviceLocations =
        companyUpdateInfoPagesModel!.serviceLocation;
    return Column(children: [
      Align(
          alignment: Alignment(-0.5, 0),
          child: Text(
            "원하시는 일자리 지역은 어디세요?",
            style: titleStyle1(),
          )),
      SizedBox(
        height: 20,
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: serviceLocations.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedIndex = index;
                          ref
                              .read(companyUpdateInfoProvider.notifier)
                              .toggleServiceLocation(
                              serviceLocations[index].city);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 120,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(koreaCity[index].city,
                                  style: serviceLocations[index].isChecked
                                      ? titleStyle3()
                                      : titleStyle2()),
                              Icon(Icons.arrow_forward_ios,
                                  color: serviceLocations[index].isChecked
                                      ? primaryColor
                                      : basicColorB9,
                                  size: 15),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 140, child: Divider())
                    ],
                  );
                },
              ),
            ),
            VerticalDivider(
              color: disableColor,
              thickness: 1,
              indent: 5,
            ),
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemCount: ref
                    .read(companyUpdateInfoProvider.notifier)
                    .extractSelectedElement(selectedIndex)
                    .length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ref
                                    .read(companyUpdateInfoProvider.notifier)
                                    .extractSelectedElement(
                                    selectedIndex)[index]
                                    .subCity,
                                style: subTitleStyle1(),
                              ),
                              InkWell(
                                  onTap: () {
                                    ref
                                        .read(companyUpdateInfoProvider
                                        .notifier)
                                        .toggleSubCity(
                                        ref
                                            .read(
                                            companyUpdateInfoProvider
                                                .notifier)
                                            .extractSelectedIndex(),
                                        index);
                                  },
                                  child: ref
                                      .read(companyUpdateInfoProvider
                                      .notifier)
                                      .extractSelectedElement(
                                      selectedIndex)[index]
                                      .isChecked
                                      ? Icon(
                                      CupertinoIcons
                                          .checkmark_alt_circle_fill,
                                      color: primaryColor)
                                      : Icon(
                                    CupertinoIcons.checkmark_alt_circle,
                                    color: disableColor,
                                  ))
                            ]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
