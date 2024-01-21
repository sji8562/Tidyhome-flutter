import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/data/model/cleaning_date.dart';

class ConfirmPageModel {
  CleaningDate? cleaningDate;
  String howToOpen;
  String doorPassword;
  String carefulETC;
  String requestETC;

  ConfirmPageModel({
    this.cleaningDate,
    required this.howToOpen,
    required this.doorPassword,
    required this.carefulETC,
    required this.requestETC,
  });

  ConfirmPageModel copyWith({
    CleaningDate? cleaningDate,
    String? howToOpen,
    String? doorPassword,
    String? carefulETC,
    String? requestETC,
  }) {
    return ConfirmPageModel(
      cleaningDate: cleaningDate ?? this.cleaningDate,
      howToOpen: howToOpen ?? this.howToOpen,
      doorPassword: doorPassword ?? this.doorPassword,
      carefulETC: carefulETC ?? this.carefulETC,
      requestETC: requestETC ?? this.requestETC,
    );
  }
}

class ConfirmPageViewModel extends StateNotifier<ConfirmPageModel?> {
  ConfirmPageViewModel(ConfirmPageModel initialState) : super(initialState);

  void setHowToOpen(String value1, String value2) {
    state = state?.copyWith(howToOpen: value1, doorPassword: value2);
  }

  void setRequestETC(String value1, String value2) {
    state = state?.copyWith(carefulETC: value1, requestETC: value2);
  }

  void setCleaningDate(String value1, String value2, String value3, String value4, bool value5, int value6, int value7) {
    state = state?.copyWith(cleaningDate: CleaningDate(value1, value2, value3, value4, value5, value6, value7));
  }

}

final confirmPageProvider = StateNotifierProvider<ConfirmPageViewModel, ConfirmPageModel?>((ref) {
  return ConfirmPageViewModel(ConfirmPageModel(howToOpen: "", doorPassword: "", carefulETC: "", requestETC: ""));
});
