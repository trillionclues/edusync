import 'package:edusync_hub/app/routes/route_paths.dart';
import 'package:edusync_hub/core/providers/app_bar_provider.dart';
import 'package:edusync_hub/core/themes/app_theme.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _isMounted = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _isMounted = true;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(appBarProvider.notifier).updateAppBar(
        title: '',
        showBackButton: false,
        showAppBar: false,
        actions: [],
      );
    });
  }

  @override
  void dispose() {
    _isMounted = false;
    _animationController.dispose();
    super.dispose();
  }

  void handleGoogleSignIn() {
    ref.read(authNotifierProvider.notifier).signInWithGoogle();
  }

  void handleAppleSignIn() {
    // ref.read(authNotifierProvider.notifier).signInWithApple();
  }

  void safeNavigate(String name) {
    if (!_isMounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isMounted) {
        context.go(name);
      }
    });
  }

  Future<void> handleSuccessfulLogin(String id) async {
    safeNavigate(AppRoute.home.name);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;

    ref.listen(authNotifierProvider, (prev, next) {
      next.maybeWhen(
        authenticated: (user) => handleSuccessfulLogin(user.id),
        error: (failure) {
          if (_isMounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: Colors.red.shade400,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SizedBox(
            height: screenHeight -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.15),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppTheme.primaryOrange,
                                AppTheme.lightOrange,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const Icon(
                                  Icons.school_rounded,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Positioned(
                                  right: -4,
                                  bottom: -4,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppTheme.primaryOrange,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              'edusync',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                letterSpacing: -1,
                              ),
                            ),
                            Positioned(
                              right: -8,
                              bottom: 6,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Make learning addictive with AI games',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 48),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: state.isLoading ? null : handleGoogleSignIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              disabledBackgroundColor: Colors.grey.shade300,
                              elevation: isDark ? 2 : 0,
                              side: BorderSide(
                                color: isDark
                                    ? Colors.transparent
                                    : Colors.grey.shade200,
                                width: 1,
                              ),
                            ),
                            child: state.isLoading
                                ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary,
                                ),
                              ),
                            )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/google.svg',
                                  height: 22,
                                  width: 22,
                                  errorBuilder: (_, __, ___) => const Icon(
                                    Icons.g_mobiledata,
                                    size: 28,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: state.isLoading ? null : handleAppleSignIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.onBackground,
                              foregroundColor: theme.colorScheme.background,
                              disabledBackgroundColor: isDark
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade700,
                              elevation: isDark ? 2 : 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.apple,
                                  size: 24,
                                  color: theme.colorScheme.background,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Continue with Apple',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.background,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        Text(
                          'By continuing, you agree to our Terms of Service and Privacy Policy.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: theme.colorScheme.onBackground.withOpacity(0.4),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}