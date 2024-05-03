import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubits/add_states.dart';
import 'package:quiz_app/cubits/app_cubit.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  final AppCubit cubit = AppCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          body: Container(
            color: Colors.deepPurple,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/quiz-logo.png',
                    width: 300,
                    color: const Color.fromARGB(180, 255, 255, 255),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Learn Flutter the fun way!',
                    style: TextStyle(color: Color.fromARGB(200, 255, 255, 255), fontSize: 24),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      cubit.switchQuizScreen(context);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.purple[800]),
                    icon: const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      'Start Quiz',
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
