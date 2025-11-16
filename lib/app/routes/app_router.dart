import 'package:flutter/cupertino.dart';
import 'package:glypha/app/routes/route_paths.dart';
import 'package:glypha/features/auth/presentation/pages/additional_details_page.dart';
import 'package:glypha/features/auth/presentation/pages/login_page.dart';
import 'package:glypha/features/home/presentation/pages/home_page.dart';
import 'package:glypha/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';


final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class AppRouter {
  static final GoRouter router = GoRouter(initialLocation: '/splash', routes: [
    GoRoute(
      path: SplashPage.route,
      name: AppRoute.splash.name,
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
