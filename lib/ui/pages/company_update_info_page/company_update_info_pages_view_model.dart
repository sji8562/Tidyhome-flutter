import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'company_code_table/company_code_table.dart';


class CompanyUpdateInfoPagesModel {
  String companyName;
  String companyBusinessNumber;
  List<ServiceType> serviceType;
  List<ServiceLocation> serviceLocation;
  Gender? gender;
  String? whereFrom;
  String? birthYear;
  String? animal;
  String? userPic;

  CompanyUpdateInfoPagesModel(
      {required this.companyName,
      required this.companyBusinessNumber,
      required this.serviceType,
      required this.serviceLocation,
      this.gender,
      this.whereFrom,
      this.birthYear,
      this.animal, this.userPic
      });

  CompanyUpdateInfoPagesModel copyWith({
    String? companyName,
    String? companyBusinessNumber,
    List<ServiceType>? serviceType,
    List<ServiceLocation>? serviceLocation,
    Gender? gender,
    String? whereFrom,
    String? birthYear,
    String? animal,
    String? userPic
  }) {
    return CompanyUpdateInfoPagesModel(
      companyName: companyName ?? this.companyName,
      companyBusinessNumber: companyBusinessNumber ?? this.companyBusinessNumber,
      serviceType: serviceType ?? this.serviceType,
      serviceLocation: serviceLocation ?? this.serviceLocation,
      gender: gender ?? this.gender,
      whereFrom: whereFrom ?? this.whereFrom,
      birthYear: birthYear ?? this.birthYear,
      animal: animal ?? this.animal,
      userPic: userPic ?? this.userPic
    );
  }

}

class CompanyUpdateInfoPagesViewModel
    extends StateNotifier<CompanyUpdateInfoPagesModel?> {
  CompanyUpdateInfoPagesViewModel(super._state);

  void setCompanyName(String companyName) {
    state = state?.copyWith(companyName: companyName);
  }

  void setCompanyBusinessNumber(String businessNumber) {
    state = state?.copyWith(companyBusinessNumber: businessNumber);
  }

  void setUserPic(String userPic) {
    state = state?.copyWith(userPic: userPic);
  }

  void toggleServiceType(String service) {
    state = state?.copyWith(
      serviceType: state?.serviceType
          .map((s) =>
      s.service == service ? ServiceType(service, !s.isChecked) : s)
          .toList(),
    );
  }

  List<ServiceType> selectedServiceTypes() {
    List<ServiceType> selectedServiceTypes =
        state?.serviceType.where((s) => s.isChecked).toList() ?? [];
    return selectedServiceTypes;
  }

  void toggleServiceLocation(String service) {
    state = state?.copyWith(
      serviceLocation: state?.serviceLocation
          ?.map((location) {
        if (location.city == service) {
          // 선택된 service의 경우
          return location.copyWith(isChecked: !location.isChecked);
        } else {
          // 선택되지 않은 다른 service의 경우
          return location.copyWith(isChecked: false, subCity: location.subCity.map((subCity) => subCity.copyWith(isChecked: false)).toList());
        }
      })
          ?.toList(),
    );
  }


  List<SubCity> extractSelectedElement(int selectedIndex) {
    int indexOfSelected = state!.serviceLocation.indexWhere(
          (serviceLocation) => serviceLocation.isChecked,
    );

    if (indexOfSelected != -1) {
      ServiceLocation selectedLocation = state!.serviceLocation[indexOfSelected];
      print("Selected City: ${selectedLocation.city}");
      return selectedLocation.subCity;
    } else {
      print("구를 찾을 수 없어 서울시의 정보를 리턴합니다");
      return state!.serviceLocation[0].subCity;
    }
  }

  int extractSelectedIndex(){
    int indexOfSelected = state!.serviceLocation.indexWhere(
            (serviceLocation) => serviceLocation.isChecked);
    return indexOfSelected;
  }

  void toggleSubCity(int locationIndex, int subCityIndex) {
    if (state == null) return;
    var updatedServiceLocation = List<ServiceLocation>.from(state!.serviceLocation);
    for (var i = 0; i < updatedServiceLocation.length; i++) {
      if (i == locationIndex) {
        var toggledSubCity = List<SubCity>.from(updatedServiceLocation[i].subCity);
        for (var j = 0; j < toggledSubCity.length; j++) {
          if (j == subCityIndex) {
            toggledSubCity[j] = toggledSubCity[j].toggleChecked();
          }
        }
        updatedServiceLocation[i] =
            updatedServiceLocation[i].copyWith(subCity: toggledSubCity);
      }
    }
    state = state!.copyWith(serviceLocation: updatedServiceLocation);
  }

  //선택된 일자리지역 List<String>으로 반환
  List<String> extractCheckedSubCities() {
    int indexOfSelected = state!.serviceLocation.indexWhere(
          (serviceLocation) => serviceLocation.isChecked,
    );

    if (indexOfSelected != -1) {
      List<SubCity> selectedSubCities = state!.serviceLocation[indexOfSelected].subCity;

      List<String> checkedSubCities =
      selectedSubCities.where((subCity) => subCity.isChecked).map((subCity) => subCity.subCity).toList();

      return checkedSubCities;
    } else {
      return state!.serviceLocation[0].subCity.map((subCity) => subCity.subCity).toList();
    }
  }

}

// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final companyUpdateInfoProvider = StateNotifierProvider<
    CompanyUpdateInfoPagesViewModel, CompanyUpdateInfoPagesModel?>((ref) {
  return CompanyUpdateInfoPagesViewModel(CompanyUpdateInfoPagesModel(
      companyName: "",
      companyBusinessNumber: "",
      serviceType: serviceTypes,
      serviceLocation: koreaCity));
});
