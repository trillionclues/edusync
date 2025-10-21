import 'package:edusync_hub/app/routes/route_paths.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_notifier.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  static const route = '/splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (previous, next) async {

      await Future.delayed(const Duration(seconds: 2));

      next.whenOrNull(
        authenticated: (user) async {
          final authRepo = ref.read(authRepositoryProvider);
          final needsDetails =
          await authRepo.needsAdditionalDetails(user.id);

          if (needsDetails) {
            context.goNamed(AppRoute.additionalDetails.name);
          } else {
            context.goNamed(AppRoute.home.name);
          }
        },
        unauthenticated: () => context.goNamed(AppRoute.login.name),
        error: (_) => context.goNamed(AppRoute.login.name),
      );
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            Text(
              'EduSync Hub',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
