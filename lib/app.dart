import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micro_habits/bootstrap.dart';
import 'package:micro_habits/core/router/app_router.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';
import 'package:micro_habits/presentation/auth/view/login_page.dart';
import 'package:micro_habits/presentation/auth/view/splash_screen.dart';
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
          debugShowCheckedModeBanner: false,
          title: 'Micro Habits',
          routerConfig: appRouter.router,
            theme: ThemeData(
              brightness: Brightness.light,
              textTheme: GoogleFonts.outfitTextTheme(),
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF4E55E0),     // vivid blue background
                secondary: Color(0xFF6B7FFF),   // lighter blue accent
                background: Color(0xFFF9F9F9),
                onBackground: Colors.white,
                error: Colors.redAccent,
                onPrimary: Color(0xFF00C9A7),
                onSecondary: Color(0xFF00C9A7),
                surface: Color(0xFF00C9A7),
                onSurface: Color(0xFF00C9A7),
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              scaffoldBackgroundColor: const Color(0xFFF9F9F9),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0F172A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
        );
      }),
    );
  }
}
