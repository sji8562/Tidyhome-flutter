import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_code_table/company_code_table.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class CompanyUpdateInfoFourthPage extends ConsumerWidget {
  const CompanyUpdateInfoFourthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CompanyUpdateInfoPagesModel? companyUpdateInfoPagesModel =
        ref.read(companyUpdateInfoProvider);
    List<ServiceType> serviceTypes = companyUpdateInfoPagesModel!.serviceType;
    List<ServiceLocation> serviceLocations = companyUpdateInfoPagesModel!.serviceLocation;
    return Scaffold(
      appBar: ArrowAppBar(leading: Icons.arrow_back, title: ""),
      body: Column(
        children: [
          Container(
            alignment: Alignment(-0.7, 0),
            child: Text(
              "입력정보를 확인해주세요",
              style: titleStyle1(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment(-0.4, 0),
            child: Text(
              "원하시는 일자리 종류와 지역은 언제든지 변경할 수 있어요.",
              style: descriptionDisableStyle(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("서비스 종류"),
                Text(
                  serviceTypes.length > 1
                      ? "${serviceTypes[0].service} 외 1개"
                      : serviceTypes[0].service,
                  style: descriptionDisableStyle(),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("일 가능한 지역"),
                Text(
                  serviceLocations.length > 1
                      ? "${serviceLocations[0].subCity} 외 1개"
                      : "${serviceLocations[0].subCity}",
                  style: descriptionDisableStyle(),
                ),
              ],
            ),
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
