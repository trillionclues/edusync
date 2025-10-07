import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/bootstrap.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';
import 'package:micro_habits/presentation/auth/view/login_page.dart';
import 'package:micro_habits/presentation/habits/cubits/habit_list_cubit.dart';
import 'package:micro_habits/presentation/habits/view/habits_page.dart';

class App extends StatelessWidget {
  const App({
    required this.dependencies,
    super.key,
  });

  final AppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(
          authRepository: dependencies.authRepository,
        ),),
        BlocProvider(create: (_) => HabitListCubit(
          habitRepository: dependencies.habitRepository,
        ),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Micro Habits',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if(state.isAuthenticated) {
            return const HabitsPage();
          }
          return const LoginPage();
        },),
      ),
    );
  }
}
