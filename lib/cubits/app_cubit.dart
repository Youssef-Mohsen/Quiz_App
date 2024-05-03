import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/cubits/add_states.dart';
import 'package:quiz_app/data/data_model.dart';
import 'package:quiz_app/screens/quiz.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class AppCubit extends Cubit<AddStates> {
  AppCubit() : super(InitialState());

  //Attributes

  late List<String> selectedAnswers = [];
  int numberOfItems = 0;

//////////////////
  //Methods

  void switchQuizScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const QuizScreen()));
    emit(SwitchQuizScreen());
  }

  void switchResultScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ResultScreen()));
    emit(SwitchResultScreen());
  }

  void addAnswers(String answer) {
    selectedAnswers.add(answer);
    emit(AddAnswers());
  }

  void restartScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StartScreen()));
    numberOfItems = 0;
    selectedAnswers = [];
    emit(RestartScreen());
  }

  List<Map<String, Object>> resultData() {
    final List<Map<String, Object>> resultData = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      resultData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return resultData;
  }

  Widget answerButton(String answer, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (selectedAnswers.length == questions.length) {
            switchResultScreen(context);
          } else {
            addAnswers(answer);
            if (numberOfItems <= 4) {
              numberOfItems++;
            } else {
              switchResultScreen(context);
            }
            emit(NextQuestion());
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[800],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
        child: Text(
          answer,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ));
  }
}
