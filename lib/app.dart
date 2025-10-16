import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/bootstrap.dart';
import 'package:micro_habits/core/router/app_router.dart';
import 'package:micro_habits/core/theme/app_theme.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';
import 'package:micro_habits/presentation/habits/cubits/habit_list_cubit.dart';

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
        BlocProvider(
          create: (_) => AuthCubit(
            authRepository: dependencies.authRepository,
          ),
        ),
        BlocProvider(
          create: (_) => HabitListCubit(
            habitRepository: dependencies.habitRepository,
          ),
        ),
      ],
      child: Builder(builder: (context) {
        final appRouter = AppRouter(context.read<AuthCubit>());

        return MaterialApp.router(
          title: 'Micro Habits',
          routerConfig: appRouter.router,
          theme: AppTheme.getThemeData(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
