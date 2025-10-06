import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/data/repositories/habit_repository.dart';
import 'package:micro_habits/presentation/habits/cubits/habit_list_cubit.dart';
import 'package:micro_habits/presentation/habits/view/habits_page.dart';

class App extends StatelessWidget {
  const App({
    required this.habitRepository,
    super.key,
  });

  final HabitRepository habitRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabitListCubit(
        habitRepository: habitRepository,
      ),
      child: MaterialApp(
        title: 'Micro Habits',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HabitsPage(),
      ),
    );
  }
}