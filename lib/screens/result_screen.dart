import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubits/add_states.dart';
import 'package:quiz_app/cubits/app_cubit.dart';
import 'package:quiz_app/data/data_model.dart';
import 'package:quiz_app/results/result_data.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  final AppCubit cubit = AppCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of<AppCubit>(context);
        final numberOfCorrectQuestions = cubit.resultData().where((data) {
          return data['correct_answer'] == data['user_answer'];
        }).length;

        return Scaffold(
          backgroundColor: Colors.deepPurple,
          body: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numberOfCorrectQuestions out of ${questions.length} questions correctly!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white,fontSize: 24),
                ),
                const SizedBox(
                  height: 30,
                ),
                Summary(),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      cubit.restartScreen(context);
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.purple[800],
                        ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.restart_alt,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Restart Quiz',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
