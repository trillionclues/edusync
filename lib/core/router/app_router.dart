import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_habits/core/router/route_paths.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';
import 'package:micro_habits/presentation/auth/view/login_page.dart';
import 'package:micro_habits/presentation/auth/view/splash_screen.dart';
import 'package:micro_habits/presentation/habits/view/widgets/habits_card.dart';
import 'package:micro_habits/presentation/habits/view/home_page.dart';

class AppRouter {
  AppRouter(this.authCubit);

  final AuthCubit authCubit;

  late final GoRouter router = GoRouter(
    initialLocation: LoginPage.route,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      final isAuthenticated = authCubit.state.isAuthenticated;
      final isSplash = state.matchedLocation == SplashScreen.route;
      final isLogging = state.matchedLocation == LoginPage.route;

      if (isSplash) return null;

      if (!isAuthenticated && !isLogging) return LoginPage.route;

      if (isAuthenticated && isLogging) return HomePage.route;

      return null;
    },
    routes: [
      GoRoute(
        path: SplashScreen.route,
        name: AppRoutePaths.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginPage.route,
        name: AppRoutePaths.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: HomePage.route,
        name: AppRoutePaths.home.name,
        builder: (context, state) => const HomePage(),
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
