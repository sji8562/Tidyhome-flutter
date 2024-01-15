class HomeWorkApplyField {
  final String question;
  List<String>? selectList;
  String? inputAnswer;

  HomeWorkApplyField({required this.question, this.selectList, this.inputAnswer});

  HomeWorkApplyField copyWith({
    String? question,
    List<String>? selectList,
    String? inputAnswer,
  }) {
    return HomeWorkApplyField(
      question: question ?? this.question,
      selectList: selectList ?? this.selectList,
      inputAnswer: inputAnswer ?? this.inputAnswer,
    );
  }
}
