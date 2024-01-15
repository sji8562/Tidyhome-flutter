import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/data/model/cleaning_date.dart';

class ResultPageModel {
  CleaningDate? cleaningDate;
  String howToOpen;
  String doorPassword;
  String carefulETC;
  String requestETC;

  ResultPageModel({
    this.cleaningDate,
    required this.howToOpen,
    required this.doorPassword,
    required this.carefulETC,
    required this.requestETC,
  });

  ResultPageModel copyWith({
    CleaningDate? cleaningDate,
    String? howToOpen,
    String? doorPassword,
    String? carefulETC,
    String? requestETC,
  }) {
    return ResultPageModel(
      cleaningDate: cleaningDate ?? this.cleaningDate,
      howToOpen: howToOpen ?? this.howToOpen,
      doorPassword: doorPassword ?? this.doorPassword,
      carefulETC: carefulETC ?? this.carefulETC,
      requestETC: requestETC ?? this.requestETC,
    );
  }
}

class ResultPageViewModel extends StateNotifier<ResultPageModel?> {
  ResultPageViewModel(ResultPageModel initialState) : super(initialState);

  void setHowToOpen(String value1, String value2) {
    state = state?.copyWith(howToOpen: value1, doorPassword: value2);
  }

  void setRequestETC(String value1, String value2) {
    state = state?.copyWith(carefulETC: value1, requestETC: value2);
  }

  void setCleaningDate(String value1, String value2, String value3, bool value4) {
    state = state?.copyWith(cleaningDate: CleaningDate(value1, value2, value3, value4));
  }

}

final resultPageProvider = StateNotifierProvider<ResultPageViewModel, ResultPageModel?>((ref) {
  return ResultPageViewModel(ResultPageModel(howToOpen: "없음", doorPassword: "없음", carefulETC: "없음", requestETC: "없음"));
});
