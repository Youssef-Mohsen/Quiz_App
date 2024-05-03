import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubits/add_states.dart';
import 'package:quiz_app/cubits/app_cubit.dart';

class Summary extends StatelessWidget {
  Summary({super.key});

  final AppCubit cubit = AppCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of<AppCubit>(context);
        return SizedBox(
          height: 380,
          child: SingleChildScrollView(
            child: Column(
              children: cubit.resultData().map((data) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.cyan,
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data['question'].toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              data['user_answer'].toString(),
                              style: const TextStyle(
                                  color: Colors.cyanAccent, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    data['correct_answer'].toString(),
                                    style: const TextStyle(
                                        color: Colors.cyan, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            Divider(
                              height: 20.0,
                              color: Colors.grey[800],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
