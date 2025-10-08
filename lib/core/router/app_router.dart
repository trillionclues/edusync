import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';
import 'package:micro_habits/presentation/auth/view/login_page.dart';
import 'package:micro_habits/presentation/auth/view/splash_screen.dart';
import 'package:micro_habits/presentation/habits/view/habits_page.dart';

class AppRouter {

  AppRouter(this.authCubit);

  final AuthCubit authCubit;

  late final GoRouter router = GoRouter(
    initialLocation: '/login',
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      final isAuthenticated = authCubit.state.isAuthenticated;
      final isSplash = state.matchedLocation == '/splash';
      final isLoging = state.matchedLocation == '/login';

      if (isSplash) return null;

      if (!isAuthenticated && !isLoging) return '/login';

      if (isAuthenticated && isLoging) return '/home';

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HabitsPage(),
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
