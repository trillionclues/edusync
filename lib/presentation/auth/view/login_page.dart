import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0xFF4E55E0),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    const Text(
                      'Build healthy habits with us',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: -2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Image.asset('assets/images/mascot.png'),
                    const Spacer(flex: 2),
                    if (state.isLoading)
                      const SizedBox(
                        height: 56,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      )
                    else ...[
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().signInWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF0F172A),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: const Text(
                            'Get started',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().signInAnonymously();
                        },
                        child: const Text(
                          'I have an account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],

                    const Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'By starting or signing in, you agree\nto our ',
                            ),
                            TextSpan(
                              text: 'Terms of use',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
