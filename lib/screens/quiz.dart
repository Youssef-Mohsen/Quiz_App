import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/cubits/add_states.dart';
import 'package:quiz_app/cubits/app_cubit.dart';
import 'package:quiz_app/data/data_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizState();
}

class _QuizState extends State<QuizScreen> {
  final AppCubit cubit = AppCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AddStates>(builder: (context, state) {
      AppCubit cubit = BlocProvider.of<AppCubit>(context);
      final currentQuestion = questions[cubit.numberOfItems];
      return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  questions[cubit.numberOfItems].text,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(200, 255, 255, 255),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                ...currentQuestion.shuffledAnswers().map((item) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: cubit.answerButton(item, context),
                  );
                }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
