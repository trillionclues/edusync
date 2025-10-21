import 'package:edusync_hub/app/routes/route_paths.dart';
import 'package:edusync_hub/core/widgets/buttons/app_buttons.dart';
import 'package:edusync_hub/core/widgets/inputs/app_text_field.dart';
import 'package:edusync_hub/core/widgets/layout/divider_with_text.dart';
import 'package:edusync_hub/core/widgets/layout/section_header.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_providers.dart';
import 'package:edusync_hub/features/auth/presentation/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:edusync_hub/app/routes/app_router.dart';
import 'package:edusync_hub/features/auth/presentation/widgets/auth_form.dart';
import 'package:edusync_hub/features/auth/presentation/provider/auth_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
  }

  @override
  void dispose() {
    _isMounted = false;
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      ref.read(authNotifierProvider.notifier).signInWithEmail(
        email: email,
        password: password,
      );
    }
  }

  void _handleGoogleSignIn() {
    ref.read(authNotifierProvider.notifier).signInWithGoogle();
  }

  void _safeNavigate(String routeName) {
    if (_isMounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_isMounted) {
          context.goNamed(routeName);
        }
      });
    }
  }

  Future<void> _handleAuthenticatedUser(String userId) async {
    if (!_isMounted) return;

    try {
      // Check if user needs additional details
      final needsDetails = await ref
          .read(authRepositoryProvider)
          .needsAdditionalDetails(userId);

      if (!_isMounted) return;

      if (needsDetails) {
        _safeNavigate(AppRoute.additionalDetails.name);
      } else {
        _safeNavigate(AppRoute.home.name);
      }
    } catch (e) {
      // If Firestore fails, default to home
      if (_isMounted) {
        _safeNavigate(AppRoute.home.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    // Listen for authentication success
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (user) {
          // Don't await here - start the process and let it complete
          _handleAuthenticatedUser(user.id);
        },
        error: (failure) {
          if (_isMounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: AuthForm(children: [
        const SectionHeader(
          title: 'Welcome to EduSync Hub',
          subtitle: 'Sign in to continue your learning journey',
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _emailController,
                labelText: 'Email Address',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                textInputAction: TextInputAction.done,
                prefixIcon: const Icon(Icons.lock_outline),
                onSubmitted: (_) => _handleSignIn(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              AppButton(
                text: 'Sign In',
                onPressed: _handleSignIn,
                isLoading: authState.isLoading,
              )
            ],
          ),
        ),
        const DividerWithText(text: 'OR'),
        SocialLoginButton(
          type: SocialLoginType.google,
          onPressed: _handleGoogleSignIn,
          isLoading: authState.isLoading,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () => AppRouter.router.goNamed('/signup'),
              child: const Text('Sign Up'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            // TODO: Navigate to forgot password
          },
          child: const Text('Forgot Password?'),
        )
      ]),
    );
  }
}