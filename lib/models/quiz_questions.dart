class QuizQuestions {
  QuizQuestions(this.text, this.answers);

  late final String text;
  late final List<String> answers;

  List<String> shuffledAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;


  }
}

class QuizQuestions2{
  QuizQuestions2(this.text, this.answers);

  late final String text;
  late final List<String> answers;

  List<String> shuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
