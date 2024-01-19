import '../company_update_info_pages_view_model.dart';
enum Gender { man, woman }

class ServiceType {
      String service;
      bool isChecked;

      ServiceType(this.service, this.isChecked);
}

List<ServiceType> serviceTypes = [
      ServiceType("가사도우미", false),
      ServiceType("이사청소", false),
      ServiceType("세탁기/침대/에어컨 청소", false),
      ServiceType("사무실 청소", false),
];


class ServiceLocation {
      String city;
      List<SubCity> subCity;
      bool isChecked;

      ServiceLocation(this.city, this.subCity, this.isChecked);

      ServiceLocation toggleChecked() {
            List<SubCity> toggledSubCity = subCity.map((subCity) => subCity.toggleChecked()).toList();
            return ServiceLocation(city, toggledSubCity, !isChecked);
      }

      ServiceLocation copyWith({String? city, List<SubCity>? subCity, bool? isChecked}) {
            return ServiceLocation(
                  city ?? this.city,
                  subCity ?? this.subCity,
                  isChecked ?? this.isChecked,
            );
      }

}

class SubCity {
      String subCity;
      bool isChecked;

      SubCity(this.subCity, this.isChecked);

      SubCity toggleChecked() {
            return SubCity(subCity, !isChecked);
      }

      SubCity copyWith({String? subCity, bool? isChecked}) {
            return SubCity(
                  subCity ?? this.subCity,
                  isChecked ?? this.isChecked,
            );
      }
}


List<ServiceLocation> koreaCity = [
  ServiceLocation(
      '서울',
      [
        SubCity('강남구', true),
        SubCity('강동구', false),
        SubCity('강북구', false),
        SubCity('강서구', false),
        SubCity('관악구', false),
        SubCity('광진구', false),
        SubCity('구로구', false),
        SubCity('금천구', false),
        SubCity('노원구', false),
        SubCity('도봉구', false),
        SubCity('동대문구', false),
        SubCity('동작구', false),
        SubCity('마포구', false),
        SubCity('서대문구', false),
        SubCity('서초구', false),
        SubCity('성동구', false),
        SubCity('성북구', false),
        SubCity('송파구', false),
        SubCity('양천구', false),
        SubCity('영등포구', false),
        SubCity('용산구', false),
        SubCity('은평구', false),
        SubCity('종로구', false),
        SubCity('중구', false),
        SubCity('중랑구', false),
      ],
      true),
  ServiceLocation(
      '부산',
      [
        SubCity('강서구', false),
        SubCity('금정구', false),
        SubCity('남구', false),
        SubCity('동구', false),
        SubCity('동래구', false),
        SubCity('부산진구', false),
        SubCity('북구', false),
        SubCity('사상구', false),
        SubCity('사하구', false),
        SubCity('서구', false),
        SubCity('수영구', false),
        SubCity('연제구', false),
        SubCity('영도구', false),
        SubCity('중구', false),
        SubCity('해운대구', false),
      ],
      false),

      ServiceLocation('인천', [
            SubCity('강화군', false),
            SubCity('계양구', false),
            SubCity('미추홀구', false),
            SubCity('남동구', false),
            SubCity('동구', false),
            SubCity('부평구', false),
            SubCity('서구', false),
            SubCity('연수구', false),
            SubCity('옹진군', false),
      ], false),
      ServiceLocation('광주', [
            SubCity('광산구', false),
            SubCity('남구', false),
            SubCity('동구', false),
            SubCity('북구', false),
            SubCity('서구', false),
      ], false),
      ServiceLocation('대전', [
            SubCity('대덕구', false),
            SubCity('동구', false),
            SubCity('서구', false),
            SubCity('유성구', false),
      ], false),
      ServiceLocation('세종', [
            SubCity('세종시', false),
      ], false),
      ServiceLocation('강원', [
            SubCity('강릉시', false),
            SubCity('고성군', false),
            SubCity('동해시', false),
            SubCity('삼척시', false),
            SubCity('속초시', false),
            SubCity('양구군', false),
            SubCity('양양군', false),
            SubCity('영월군', false),
            SubCity('원주시', false),
            SubCity('인제군', false),
            SubCity('정선군', false),
            SubCity('철원군', false),
            SubCity('춘천시', false),
            SubCity('태백시', false),
            SubCity('평창군', false),
            SubCity('홍천군', false),
            SubCity('화천군', false),
            SubCity('횡성군', false),
      ], false),
      ServiceLocation('경기', [
            SubCity('가평군', false),
            SubCity('고양시', false),
            SubCity('과천시', false),
            SubCity('광명시', false),
            SubCity('광주시', false),
            SubCity('구리시', false),
            SubCity('군포시', false),
            SubCity('김포시', false),
            SubCity('남양주시', false),
            SubCity('동두천시', false),
            SubCity('부천시', false),
            SubCity('성남시', false),
            SubCity('수원시', false),
            SubCity('시흥시', false),
            SubCity('안산시', false),
            SubCity('안성시', false),
            SubCity('안양시', false),
            SubCity('양주시', false),
            SubCity('양평군', false),
            SubCity('여주시', false),
            SubCity('연천군', false),
            SubCity('오산시', false),
            SubCity('용인시', false),
            SubCity('의왕시', false),
            SubCity('의정부시', false),
            SubCity('이천시', false),
            SubCity('파주시', false),
            SubCity('평택시', false),
            SubCity('포천시', false),
            SubCity('하남시', false),
            SubCity('화성시', false),
      ], false),
      ServiceLocation('경남', [
            SubCity('거제시', false),
            SubCity('거창군', false),
            SubCity('고성군', false),
            SubCity('김해시', false),
            SubCity('남해군', false),
            SubCity('밀양시', false),
            SubCity('사천시', false),
            SubCity('산청군', false),
            SubCity('양산시', false),
            SubCity('의령군', false),
            SubCity('진주시', false),
            SubCity('창녕군', false),
            SubCity('창원시', false),
            SubCity('통영시', false),
            SubCity('하동군', false),
            SubCity('함안군', false),
            SubCity('함양군', false),
            SubCity('합천군', false),
      ], false),
      ServiceLocation('경북', [
            SubCity('경산시', false),
            SubCity('경주시', false),
            SubCity('고령군', false),
            SubCity('구미시', false),
            SubCity('군위군', false),
            SubCity('김천시', false),
            SubCity('문경시', false),
            SubCity('봉화군', false),
            SubCity('상주시', false),
            SubCity('성주군', false),
            SubCity('안동시', false),
            SubCity('영덕군', false),
            SubCity('영양군', false),
            SubCity('영주시', false),
            SubCity('영천시', false),
            SubCity('예천군', false),
            SubCity('울릉군', false),
            SubCity('울진군', false),
            SubCity('의성군', false),
            SubCity('청도군', false),
            SubCity('청송군', false),
            SubCity('칠곡군', false),
            SubCity('포항시', false),
      ], false),
      ServiceLocation('전남', [
            SubCity('강진군', false),
            SubCity('고흥군', false),
            SubCity('곡성군', false),
            SubCity('광양시', false),
            SubCity('구례군', false),
            SubCity('나주시', false),
            SubCity('담양군', false),
            SubCity('목포시', false),
            SubCity('무안군', false),
            SubCity('보성군', false),
            SubCity('순천시', false),
            SubCity('신안군', false),
            SubCity('여수시', false),
            SubCity('영광군', false),
            SubCity('영암군', false),
            SubCity('완도군', false),
            SubCity('장성군', false),
            SubCity('장흥군', false),
            SubCity('진도군', false),
            SubCity('함평군', false),
            SubCity('해남군', false),
            SubCity('화순군', false),
      ], false),
      ServiceLocation('전북', [
            SubCity('고창군', false),
            SubCity('군산시', false),
            SubCity('김제시', false),
            SubCity('남원시', false),
            SubCity('무주군', false),
            SubCity('부안군', false),
            SubCity('순창군', false),
            SubCity('완주군', false),
            SubCity('익산시', false),
            SubCity('임실군', false),
            SubCity('장수군', false),
            SubCity('전주시', false),
            SubCity('정읍시', false),
            SubCity('진안군', false),
      ], false),
      ServiceLocation('충남', [
            SubCity('계룡시', false),
            SubCity('공주시', false),
            SubCity('금산군', false),
            SubCity('논산시', false),
            SubCity('당진시', false),
            SubCity('보령시', false),
            SubCity('부여군', false),
            SubCity('서산시', false),
            SubCity('서천군', false),
            SubCity('아산시', false),
            SubCity('예산군', false),
            SubCity('천안시', false),
            SubCity('청양군', false),
            SubCity('태안군', false),
            SubCity('홍성군', false),
      ], false),
      ServiceLocation('충북', [
            SubCity('괴산군', false),
            SubCity('단양군', false),
            SubCity('보은군', false),
            SubCity('영동군', false),
            SubCity('옥천군', false),
            SubCity('음성군', false),
            SubCity('제천시', false),
            SubCity('증평군', false),
            SubCity('진천군', false),
            SubCity('청주시', false),
            SubCity('충주시', false),
      ], false),
      ServiceLocation('제주', [
            SubCity('서귀포시', false),
            SubCity('제주시', false),
      ], false),
];