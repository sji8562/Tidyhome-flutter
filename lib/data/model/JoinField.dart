class JoinField {
  final String title;
  final String? description;
  final String arrowTitle;
  final bool isValidated;
  final bool resendVisible;
  String? placeholder;
  String? inputGubun;
  String? inputTel;
  String? inputAuthNumber;


  JoinField({required this.title, this.description, required this.arrowTitle, this.inputGubun, this. inputTel, this.inputAuthNumber, this.placeholder, this.isValidated = false, this.resendVisible = false});

  JoinField copyWith({
    String? title,
    String? description,
    String? arrowTitle,
    String? inputGubun,
    String? inputTel,
    String? inputAuthNumber,
    String? placeholder,
    bool? isValidated,
    bool? resendVisible
  }) {
    return JoinField(
      title: title ?? this.title,
      description: description ?? this.description,
      arrowTitle: arrowTitle ?? this.arrowTitle,
      inputGubun: inputGubun ?? this.inputGubun,
      inputTel: inputTel ?? this.inputTel,
      inputAuthNumber: inputAuthNumber ?? this.inputAuthNumber,
      placeholder: placeholder ?? this.placeholder,
      isValidated: isValidated ?? this.isValidated,
      resendVisible: resendVisible ?? this.resendVisible
    );
  }
}
