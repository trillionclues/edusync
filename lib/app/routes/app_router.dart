import 'package:edusync_hub/app/routes/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:edusync_hub/features/splash/presentation/pages/splash_page.dart';
import 'package:edusync_hub/features/auth/presentation/pages/login_page.dart';
import 'package:edusync_hub/features/auth/presentation/pages/additional_details_page.dart';
import 'package:edusync_hub/features/home/presentation/pages/home_page.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class AppRouter {
  static final GoRouter router = GoRouter(initialLocation: '/splash', routes: [
    GoRoute(
      path: SplashPage.route,
      name:AppRoute.splash.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: LoginPage.route,
      name: AppRoute.login.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AdditionalDetailsPage.route,
      name: AppRoute.additionalDetails.name,
      builder: (context, state) => const AdditionalDetailsPage(),
    ),
    GoRoute(
      path: HomePage.route,
      name: AppRoute.home.name,
      builder: (context, state) => const HomePage(),
    ),
  ], observers: [
    routeObserver
  ]);
}
