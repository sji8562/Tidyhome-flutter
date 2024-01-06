class JoinField {
  final String title;
  final String? description;
  final String arrowTitle;
  String? placeholder;
  String? inputGubun;
  String? inputTel;
  String? inputAuthNumber;

  JoinField({required this.title, this.description, required this.arrowTitle, this.inputGubun, this. inputTel, this.inputAuthNumber, this.placeholder});

  JoinField copyWith({
    String? title,
    String? description,
    String? arrowTitle,
    String? inputGubun,
    String? inputTel,
    String? inputAuthNumber,
    String? placeholder,
  }) {
    return JoinField(
      title: title ?? this.title,
      description: description ?? this.description,
      arrowTitle: arrowTitle ?? this.arrowTitle,
      inputGubun: inputGubun ?? this.inputGubun,
      inputTel: inputTel ?? this.inputTel,
      inputAuthNumber: inputAuthNumber ?? this.inputAuthNumber,
      placeholder: placeholder ?? this.placeholder
    );
  }
}
